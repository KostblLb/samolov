class CoursePartProgressSerializer < ActiveModel::Serializer
  attributes :id, :max_points, :points, :user_id, :state, :deadline
  has_many :unit_progresses
end
