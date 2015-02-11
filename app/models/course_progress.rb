class CourseProgress
  include Mongoid::Document

  # TODO: should be deprecated. Course should be delegated to group
  belongs_to :course
  belongs_to :user
  belongs_to :group
  has_many :course_part_progresses, dependent: :destroy

  delegate :scale, to: :group

  after_create :create_part_progresses

  def max_points
    course_part_progresses.inject(0) {|sum, p| sum + p.max_points}
  end

  private
  def create_part_progresses
    course.parts.each {|p| create_course_part_progress(p) }
  end
  def create_course_part_progress(part)
    course_part_progresses.create  part: part, user: user
  end
end
