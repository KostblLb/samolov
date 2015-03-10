class Homework::Task::TaskSerializer < ActiveModel::Serializer
  attributes :description, :is_correct, :comment, :order
  has_many :subtasks, class: Homework::Task::Subtask::BaseSerializer
end
