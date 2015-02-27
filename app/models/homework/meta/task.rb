module Homework
  module Meta
    class Task
      include Mongoid::Document
      field :task_class
      field :description
      field :order, type: Integer
      field :table_head, type: Array
      embeds_many :meta_rows, class_name: 'Homework::Meta::Row'
      accepts_nested_attributes_for :meta_rows

      embedded_in :meta, class_name: 'Homework::Meta::Base'
    end
  end
end