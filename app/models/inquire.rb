class Inquire
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  field :name
  field :phone
  field :email

  validates :name, :phone, presence: true
end
