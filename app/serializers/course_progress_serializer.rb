class CourseProgressSerializer < ActiveModel::Serializer
  attributes :id, :max_points, :points
end
