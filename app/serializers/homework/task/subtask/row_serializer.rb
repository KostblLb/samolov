class Homework::Task::Subtask::RowSerializer < ActiveModel::Subtask::Serializer
  attributes :id, :cells, :name, :colspan
end