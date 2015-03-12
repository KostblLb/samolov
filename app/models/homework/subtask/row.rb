module Homework
  module Subtask
    class Row
      include Mongoid::Document
      field :cells, type: Array
      field :name
      field :colspan
      field :rowspan
      embedded_in :table, class_name: 'Homework::Subtask::Table'

    end
  end
end
