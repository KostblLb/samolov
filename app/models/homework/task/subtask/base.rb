module Homework
  module Task
    module Subtask
      class Base
        include Mongoid::Document
        field :description
        field :is_complete, type: Boolean, default: false
        field :order, type: Integer

        embedded_in :task, class_name: 'Homework::Task::Task', inverse_of: :tasks
      end
    end
  end
end