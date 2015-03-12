module Homework
  module Subtask
    class Row
      include Mongoid::Document

      field :cells, type: Array

      belongs_to :meta_row, class_name: 'Homework::Meta::Subtask::Row'
      embedded_in :table, class_name: 'Homework::Subtask::Table'

      delegate :name, :cplspan, :rowspan, to: :meta_row
    end
  end
end
