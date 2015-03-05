class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :subject, :created_at, :updated_at
  has_many :users
  has_many :messages
end
