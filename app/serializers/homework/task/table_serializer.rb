class Homework::Task::TableSerializer < Homework::Task::BaseSerializer
  attributes :id, :description, :order, :type, :col_names, :is_verified, :_type
  has_many :rows

end