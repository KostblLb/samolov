class Homework::Task::TextSerializer < Homework::Task::BaseSerializer
  attributes :id, :description, :answer, :order, :type, :_type
end