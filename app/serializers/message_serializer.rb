class MessageSerializer < ActiveModel::Serializer
  attributes :id, :body, :sender_id, :created_at
end
