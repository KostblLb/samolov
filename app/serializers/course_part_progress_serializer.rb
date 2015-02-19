class CoursePartProgressSerializer < ActiveModel::Serializer
  attributes :id, :max_points, :points, :user_id
  has_many :unit_progresses
end
