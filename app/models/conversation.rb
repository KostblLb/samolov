class Conversation
  include Mongoid::Document
  include Mongoid::Timestamps

  field :subject

  has_and_belongs_to_many :users

  embeds_many :messages, cascade_callbacks: true
  accepts_nested_attributes_for :messages

  default_scope -> {desc(:updated_at)}

  validates :user_ids, length: { minimum: 2 }

  def has_unread_for?(user)
    msg_count = 0
    messages.each do |msg|
      msg_count += msg.receipts.where(recipient_id: user.id, is_read: false).count
    end
    msg_count > 0
  end

end
