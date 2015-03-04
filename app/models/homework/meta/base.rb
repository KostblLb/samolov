module Homework
  module Meta
    class Base
      include Mongoid::Document
      field :task_class
      field :description
      field :order, type: Integer

      embedded_in :meta, class_name: 'Homework::Meta::Progress'

      def build_t(progress)
        def cname
         ('Homework::Task::'+task_class).constantize
        end
      end
    end
  end
end