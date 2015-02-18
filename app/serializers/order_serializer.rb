class OrderSerializer < ActiveModel::Serializer
  attributes :id, :cost, :course_id
end
