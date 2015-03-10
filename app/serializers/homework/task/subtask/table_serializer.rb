class Homework::Task::Subtask::TableSerializer < Homework::Task::Subtask::BaseSerializer
  attributes :id, :description, :order, :type, :col_names,  :_type
  has_many :rows

end