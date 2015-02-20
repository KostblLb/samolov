class CourseProgressSerializer < ActiveModel::Serializer
  attributes :id, :max_points, :points, :user_id
  has_many :course_part_progresses
end
