class Homework::Subtask::RowSerializer < ActiveModel::Serializer
  attributes :id, :cells, :name, :colspan, :rowspan
end