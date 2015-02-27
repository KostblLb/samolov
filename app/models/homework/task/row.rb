module Homework
  module Task
    class Row
      include Mongoid::Document
      field :cells, type: Array
      field :name
      field :colspan
      embedded_in :table, class_name: 'Homework::Task::Table'
    end
  end
end
