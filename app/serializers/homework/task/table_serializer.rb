class Homework::Task::TableSerializer < ActiveModel::Serializer
  attributes :id, :description, :order, :type, :table_head, :is_verified
  has_many :rows
end