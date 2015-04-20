module Homework
    class Task
      include Mongoid::Document

      field :is_correct, type: Boolean, default: false
      field :comment

      belongs_to :meta, class_name: 'Homework::Meta::Task'

      embeds_many :subtasks, class_name: 'Homework::Subtask::Base', cascade_callbacks: true

      embedded_in :progress, class_name: 'Homework::Progress', inverse_of: :tasks

      accepts_nested_attributes_for :subtasks

      delegate :description, :order, to: :meta

      after_create :sort_subtasks

      def sort_subtasks
        subtasks.sort_by{|subtask| subtask.order}
      end
    end
end
