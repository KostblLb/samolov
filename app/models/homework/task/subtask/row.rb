module Homework
  module Task
    module Subtask
      class Row
        include Mongoid::Document
        field :cells, type: Array
        field :name
        field :colspan
        field :rowspan
        embedded_in :table, class_name: 'Homework::Task::Subtask::Table'
      end
    end
  end
end
