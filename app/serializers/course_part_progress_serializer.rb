class CoursePartProgressSerializer < ActiveModel::Serializer
  attributes :id, :max_points, :points, :user_id, :part_beginning, :deadline, :unit_progress_ids
  has_many :unit_progresses
end
