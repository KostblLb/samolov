module Homework
  module Meta
    class Task
      include Mongoid::Document

      field :description
      field :order, type: Integer

      has_many :subtasks, class_name: 'Homework::Meta::Subtask::Base'

      belongs_to :meta, class_name: 'Homework::Meta::Progress'

      def build_tsk
        task = Homework::Task.new(description: description, order: order)
        subtasks.each do |subtask|
          task.subtasks << subtask.build_subtsk
        end
        task
      end
    end
  end
end
