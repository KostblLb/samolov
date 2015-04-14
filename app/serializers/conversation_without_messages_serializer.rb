class ConversationWithoutMessagesSerializer < ActiveModel::Serializer
  attributes :id, :subject, :created_at, :updated_at, :has_unread
  has_many :users, serializer: UserWithoutFriendsSerializer
  has_many :messages

  def messages
    [@object.messages.last]
  end

  def has_unread
    @object.has_unread_for? @scope
  end
end
