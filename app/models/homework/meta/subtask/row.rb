module Homework
  module Meta
    module Subtask
      class Row
        include Mongoid::Document
        field :meta_cells, type: Array
        field :name
        field :colspan
        belongs_to :meta_task, class_name: 'Homework::Meta::Subtask::Table'

        def build_row
         Homework::Subtask::Row.new name: name, cells:meta_cells
        end
      end
    end
  end
end