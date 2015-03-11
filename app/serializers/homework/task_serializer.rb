class Homework::TaskSerializer < ActiveModel::Serializer
  attributes :id, :description, :is_correct, :comment, :order
  has_many :subtasks
end
