module Homework
  class Progress
    include Mongoid::Document

    embeds_many :textfields, :class_name => 'Homework::TextField'
    has_one :homework_meta, :class_name => 'Homework::Meta'
    belongs_to :unit_progress
    accepts_nested_attributes_for :textfields

  #   after_create create_tasks
  #     homework_meta.task_meta.each do
  #       cname = homework_meta.task_meta.task_class.constantize
  #       cname.create
  #     end
  end
end