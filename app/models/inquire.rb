class Inquire
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  field :name
  field :phone
  field :email

end
