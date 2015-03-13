module Homework
  module Subtask
    class Row
      include Mongoid::Document

      field :cells, type: Array

      belongs_to :meta, class_name: 'Homework::Meta::Subtask::Row'
      embedded_in :table, class_name: 'Homework::Subtask::Table'

      delegate :name, :colspan, :rowspan, to: :meta
    end
  end
end
