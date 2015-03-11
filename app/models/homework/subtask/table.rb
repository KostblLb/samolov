module Homework
  module Subtask
    class Table < Base
      embeds_many :rows, class_name: 'Homework::Subtask::Row'
      field :col_names, type: Array
      accepts_nested_attributes_for :rows
    end
  end
end