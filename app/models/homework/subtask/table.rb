module Homework
  module Subtask
    class Table < Base
      embeds_many :rows, class_name: 'Homework::Subtask::Row'

      accepts_nested_attributes_for :rows

      delegate :col_names, to: :meta
    end
  end
end