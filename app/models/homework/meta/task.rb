module Homework
  module Meta
    class Task
      include Mongoid::Document

      field :description
      field :order, type: Integer

      has_many :subtasks, class_name: 'Homework::Meta::Subtask::Base', dependent: :destroy

      belongs_to :meta, class_name: 'Homework::Meta::Progress'

      def build_instance
        task = Homework::Task.new(meta: self, order: order)
        subtasks.each do |subtask|
          task.subtasks << subtask.build_instance
        end
        task
      end
    end
  end
end
