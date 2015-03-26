class CourseProgress
  include Mongoid::Document

  field :is_complete, default: false

  # TODO: should be deprecated. Course should be delegated to group
  belongs_to :course
  belongs_to :user
  belongs_to :group
  has_many :course_part_progresses, dependent: :destroy

  delegate :scale, to: :group
  delegate :teacher, to: :group
  after_create :create_part_progresses

  def max_points
    course_part_progresses.inject(0) {|sum, p| sum + p.max_points}
  end

  def points
    course_part_progresses.inject(0) {|sum, p| sum + p.points}
  end

  def resolve_state(course_part_progress)
    next_part = next_part_progress(course_part_progress)
    if next_part
      next_part.activate
    else
      self.is_complete = true
    end
  end

  def next_part_progress(course_part_progress)
    next_part = course.parts.where(:position.gte => course_part_progress.part.position, :id.ne => course_part_progress.part).first
    if next_part
      CoursePartProgress.where(part: next_part, user: user, state: 'disabled').first
    else
      nil
    end
  end

  def rebuild!
    course.parts.each do |part|
      unless user.has_part?(part)
        user.course_part_progresses.create part: part, course_progress: self, user: user
      end
      user.course_part_progress_by(part).rebuild!
    end
  end

  def course_beginning
    group.education_beginning
  end

  def deadline
    course_beginning + course.duration
  end

  private
  def create_part_progresses
    course.parts.each {|p| create_course_part_progress(p) }
    first_part = course_part_progresses.where(part: course.parts.first).first
    first_part.activate
    first_part.unit_progresses.where(unit: first_part.part.units.first).first.next_step
  end
  def create_course_part_progress(part)
    course_part_progresses.create  part: part, user: user
  end
end
