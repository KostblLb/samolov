class Homework::Task::Subtask::RowSerializer < ActiveModel::Serializer
  attributes :id, :cells, :name, :colspan
end