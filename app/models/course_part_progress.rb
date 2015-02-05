class CoursePartProgress
  include Mongoid::Document

  belongs_to :course_progress
  belongs_to :unit_progress
end