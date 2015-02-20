module Homework
  module Meta
    class Base
      include Mongoid::Document
      embeds_many :tasks
      belongs_to :progress, :class_name => 'Homework::Progress'
      belongs_to :unit, inverse_of: :homework
      accepts_nested_attributes_for :tasks

      def create_tasks_by_meta(progress)
        progress.homework_meta.tasks.each do |task|
          cname = ('Homework::Task::'+task.task_class).constantize
          cname.create :progress => progress
        end
      end
    end
  end
end