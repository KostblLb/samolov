module Homework
  module Meta
    module Subtask
      class Base
        include Mongoid::Document
        field :task_class
        field :description
        field :order, type: Integer

        belongs_to :task, class_name: 'Homework::Meta::Task'

        def build_instance
        end
      end
    end
  end
end