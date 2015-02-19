module Homework
  class HomeworkMeta
    include Mongoid::Document
    embeds_many :meta_tasks
    belongs_to :progress, :class_name => 'Homework::Progress'
    accepts_nested_attributes_for :meta_tasks

    def tasks(progress)
      progress.homework_meta.meta_tasks.each do |meta_task|
        cname = ('Homework::'+meta_task.task_class).constantize
        cname.create :progress => progress
      end
    end
  end
end