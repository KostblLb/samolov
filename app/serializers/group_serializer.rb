class GroupSerializer < ActiveModel::Serializer
  attributes :id, :teacher, :name

  has_one :course
  has_many :adverts
  has_many :students
end
