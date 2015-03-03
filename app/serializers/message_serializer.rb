class MessageSerializer < ActiveModel::Serializer
  attributes :id, :body, :sender_id
end
