module Homework
  module Meta
    class Row
      include Mongoid::Document
      field :meta_row, type: Array

      embedded_in :meta_task, class_name: 'Homework::Meta::Task'
    end
  end
end