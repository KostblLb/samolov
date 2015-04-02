class CourseProgressSerializer < ActiveModel::Serializer
  attributes :id, :max_points, :points, :user_id, :is_complete, :deadline, :course_part_progress_ids
end
