class ConversationSerializer < ConversationWithoutMessagesSerializer
  def messages
    @object.messages
  end
end
