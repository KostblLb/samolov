module Homework
  module Meta
    module Subtask
      class Base
        include Mongoid::Document
        field :task_class
        field :description
        field :order, type: Integer

        belongs_to :task, class_name: 'Homework::Meta::Task'
        default_scope -> {asc :order}

        def build_instance(class_name = nil)
          inst_class = class_name || "Homework::Subtask::#{self.class.name.demodulize}"
          Object.const_get(inst_class).new(meta: self, order: order)
        end
      end
    end
  end
end