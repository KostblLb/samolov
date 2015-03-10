class Homework::Task::TableSerializer < Homework::Task::BaseSerializer
  attributes :id, :description, :order, :type, :col_names,  :_type
  has_many :rows

end