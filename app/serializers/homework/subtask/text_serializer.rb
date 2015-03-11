class Homework::Subtask::TextSerializer < Homework::Subtask::BaseSerializer
  attributes :id, :description, :answer, :order, :type, :_type
end