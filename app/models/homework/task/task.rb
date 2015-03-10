module Homework
  module Task
    class Task
      include Mongoid::Document

      field :is_correct, type: Boolean, default: false
      field :comment
      field :description
      field :order, type: Integer
      field :is_complete, type: Boolean, default: false

      embeds_many :subtask, class_name: 'Homework::Task::Subtask::Base'

      embedded_in :progress, class_name: 'Homework::Progress', inverse_of: :tasks
      def build_t

      end
    end
  end
end
