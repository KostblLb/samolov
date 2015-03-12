module Homework
  module Meta
    module Subtask
      class Row
        include Mongoid::Document
        field :meta_cells, type: Array
        field :name
        field :colspan
        field :rowspan
        belongs_to :meta_task, class_name: 'Homework::Meta::Subtask::Table'

        def build_instance
         Homework::Subtask::Row.new cells:meta_cells
        end
      end
    end
  end
end