class InquireSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :created_at
end
