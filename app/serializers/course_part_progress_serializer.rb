class CoursePartProgressSerializer < ActiveModel::Serializer
  attributes :id, :max_points, :points, :user_id, :state, :unit_progress_ids
end
