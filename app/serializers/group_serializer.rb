class GroupSerializer < ActiveModel::Serializer
  attributes :id, :student_ids, :teacher_id
end
