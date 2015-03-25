class CourseProgressSerializer < ActiveModel::Serializer
  attributes :id, :max_points, :points, :user_id, :is_complete, :deadline
  has_many :course_part_progresses
end
