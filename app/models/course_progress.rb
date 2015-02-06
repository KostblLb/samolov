class CourseProgress
  include Mongoid::Document

  belongs_to :course
  belongs_to :student, class_name: 'User'
  has_many :course_part_progresses, dependent: :destroy


  after_create :create_part_progresses

  private
  def create_part_progresses
    course.parts.each {|p| create_course_part_progress(p) }
  end
  def create_course_part_progress(part)
    course_part_progresses.create  part: part
  end
end
