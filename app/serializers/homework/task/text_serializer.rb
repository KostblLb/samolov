class Homework::Task::TextSerializer < Homework::Task::BaseSerializer
  attributes :id, :description, :answer, :order, :type, :is_verified, :_type
end