class Homework::Subtask::TableSerializer < Homework::Subtask::BaseSerializer
  attributes :id, :description, :order, :type, :col_names,  :_type
  has_many :rows

end