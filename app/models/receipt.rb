class Receipt
  include Mongoid::Document

  field :is_read, type: Boolean, default: false

  belongs_to :recipient, class_name: 'User'

  embedded_in :message
  accepts_nested_attributes_for :message
end
