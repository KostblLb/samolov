class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :subject
  has_many :users
end
