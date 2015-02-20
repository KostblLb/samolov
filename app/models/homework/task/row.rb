module Homework
  module Task
    class Row
      include Mongoid::Document
      field :row, type: Array
      embedded_in :table, class_name: 'Homework::Task::Table'
    end
  end
end
