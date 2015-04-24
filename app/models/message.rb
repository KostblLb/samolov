class Message
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  field :body

  embedded_in :conversation
  embeds_many :receipts
  accepts_nested_attributes_for :receipts

  belongs_to :sender, class_name: 'User'

  after_create do
    conversation.users.each do |current_user|
      receipts.build(recipient: current_user) if current_user != sender
    end

  end

  def unread?(user)
    receipts.where(recipient_id: user.id, is_read: true).count >= 1
  end

  def viewed_by(user)
    receipt = receipts.where(recipient_id: user.id).first
    return false if receipt.nil?
    receipt.update(:is_read => true)
  end
end
