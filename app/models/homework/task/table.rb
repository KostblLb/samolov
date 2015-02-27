module Homework
  module Task
    class Table < Base
      embeds_many :rows, class_name: 'Homework::Task::Row'
      field :table_head, type: Array
      accepts_nested_attributes_for :rows
    end
  end
end