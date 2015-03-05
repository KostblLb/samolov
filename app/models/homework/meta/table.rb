module Homework
  module Meta
    class Table < Base
      include Mongoid::Document
      field :col_names, type: Array
      embeds_many :meta_rows, class_name: 'Homework::Meta::Row'
      accepts_nested_attributes_for :meta_rows

      def build_t
        super
        table = Homework::Task::Table.new description: description, order: order, col_names: col_names
        meta_rows.each do |row|
          table.rows << row.build_row
        end
        table
      end
    end
  end
end
