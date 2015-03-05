module Homework
  module Meta
    class Row
      include Mongoid::Document
      field :meta_cells, type: Array
      field :name
      field :colspan
      embedded_in :meta_task, class_name: 'Homework::Meta::Table'

      def build_row
       Homework::Task::Row.new name: name, cells:meta_cells
      end
    end
  end
end