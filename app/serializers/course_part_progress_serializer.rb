class CoursePartProgressSerializer < ActiveModel::Serializer
  attributes :id, :max_points, :points, :user_id, :state, :deadline, :unit_progress_ids
  has_many :unit_progresses
end
