module Homework
  module Meta
    class Table < Base
      field :col_names, type: Array
      embeds_many :meta_rows, class_name: 'Homework::Meta::Row'
      accepts_nested_attributes_for :meta_rows

      def build_t(progress)
        super
        table = cname.create progress: progress, description: description, order: order
        table.col_names = col_names
        meta_rows.each do |row|
         row.build_row(table)
        end
      end
    end
  end
end
