module Homework
  module Meta
    module Subtask
      class Table < Base
        include Mongoid::Document
        field :col_names, type: Array
        has_many :meta_rows, class_name: 'Homework::Meta::Subtask::Row'
        #accepts_nested_attributes_for :meta_rows

        def build_subtsk
          super
          table = Homework::Subtask::Table.new description: description, order: order, col_names: col_names
          meta_rows.each do |row|
            table.rows << row.build_row
          end
          table
        end
      end
    end
  end
end
