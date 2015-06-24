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

  def rebuild!
    course.parts.each do |part|
      unless user.has_part?(part)
        user.course_part_progresses.create part: part, course_progress: self, user: user
      end
      user.course_part_progress_by(part).rebuild!
    end
  end

  def course_beginning
    course_part_progresses.first.part_beginning
  end

  def deadline
    course_part_progresses.last.deadline
  end

  private
  def create_part_progresses
    course.parts.each {|p| create_course_part_progress(p) }
  end
  def create_course_part_progress(part)
    course_part_progresses.create  part: part, user: user
  end
end
