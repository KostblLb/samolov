class PartSerializer < ActiveModel::Serializer
  attributes :id, :name, :course_id, :unit_ids
end
