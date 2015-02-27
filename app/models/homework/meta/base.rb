module Homework
  module Meta
    class Base
      include Mongoid::Document
      embeds_one :meta_task, class_name: 'Homework::Meta::Task'
      belongs_to :progress, class_name: 'Homework::Progress'
      belongs_to :unit, inverse_of: :homework_metas



      accepts_nested_attributes_for :meta_task

      def create_tasks_by_meta(progress, meta)
        cname = ('Homework::Task::'+meta.meta_task.task_class).constantize
        t = cname.create progress: progress, description: meta.meta_task.description, order: meta.meta_task.order, type:meta.meta_task.task_class
        if cname == Homework::Task::Table
          t.table_head = meta.meta_task.table_head
          meta.meta_task.meta_rows.each do |row|
           t.rows.create cells: row.meta_cells, name: row.name, colspan: row.colspan
          end
        end
      end
    end
  end
end