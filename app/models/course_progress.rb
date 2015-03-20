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

  def resolve_state(position)
    next_part = next_part_progress(position)
    if next_part
      next_part.activate
    else
      self.is_complete = true
    end
    next_part
  end

  def next_part_progress(position)
    next_part = course.parts.where(:position.gte => position).first
    if next_part
      CoursePartProgress.where(part: next_part, user: user, state: 'disabled').first
    else
      nil
    end
  end

  private
  def create_part_progresses
    course.parts.each {|p| create_course_part_progress(p) }
  end
  def create_course_part_progress(part)
    course_part_progresses.create  part: part, user: user
  end
end
