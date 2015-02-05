class CourseProgress
  include Mongoid::Document

  belongs_to :course
  belongs_to :student, class_name: 'User'
  has_many :course_part_progresses, dependent: :destroy


  after_create :create_course_part_progress

  private
  def create_course_part_progress
    course_part_progresses.create
  end
end
