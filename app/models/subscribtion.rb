class Subscribtion
  include Mongoid::Document

  field :new_message,   type: Boolean, default: true
  field :new_advert,    type: Boolean, default: true
  field :new_event,     type: Boolean, default: true
  field :module_start,  type: Boolean, default: true

  belongs_to :user
end