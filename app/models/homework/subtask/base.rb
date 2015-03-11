module Homework
  module Subtask
    class Base
      include Mongoid::Document
      field :description
      field :is_complete, type: Boolean, default: false
      field :order, type: Integer

      embedded_in :task, class_name: 'Homework::Task', inverse_of: :subtasks
    end
  end
end