class CourseProgress
  include Mongoid::Document

  belongs_to :course
  belongs_to :student, class_name: 'User'
  has_many :course_part_progresses


  after_create :create_course_part_progress_for_course_progress

  private
  def create_course_part_progress_for_course_progress
   course_part_progress.create
  end
end
