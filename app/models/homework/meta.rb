module Homework
  class Meta
    include Mongoid::Document
    embeds_many :meta_tasks, class_name: 'Homework::MetaTask'
    belongs_to :homework_progress, :class_name => 'Homework::Progress'
    accepts_nested_attributes_for :meta_tasks
  end
end