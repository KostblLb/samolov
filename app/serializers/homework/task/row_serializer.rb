class Homework::Task::RowSerializer < ActiveModel::Serializer
  attributes :id, :cells, :name, :colspan
end