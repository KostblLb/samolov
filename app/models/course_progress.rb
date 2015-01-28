class CourseProgress
  include Mongoid::Document

  belongs_to :course
  belongs_to :user
end
