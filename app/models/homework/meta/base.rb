module Homework
  module Meta
    class Base
      include Mongoid::Document
      field :task_class
      field :description
      field :order, type: Integer

      embedded_in :meta, class_name: 'Homework::Meta::Progress'

      def build_t

      end
    end
  end
end