class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :subject, :created_at, :updated_at, :has_unread
  has_many :users
  has_many :messages

  def has_unread
    @object.has_unread_for? @scope
  end
end
