class Conversation
  include Mongoid::Document
  include Mongoid::Timestamps

  field :subject

  has_and_belongs_to_many :users

  embeds_many :messages, cascade_callbacks: true
  accepts_nested_attributes_for :messages



end
