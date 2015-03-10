class Homework::Task::Subtask::TextSerializer < Homework::Task::Subtask::BaseSerializer
  attributes :id, :description, :answer, :order, :type, :_type
end