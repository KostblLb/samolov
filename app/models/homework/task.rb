module Homework
    class Task
      include Mongoid::Document

      field :is_correct, type: Boolean, default: false
      field :comment
      field :order, type: Integer

      belongs_to :meta, class_name: 'Homework::Meta::Task'

      embeds_many :subtasks, class_name: 'Homework::Subtask::Base', cascade_callbacks: true

      embedded_in :progress, class_name: 'Homework::Progress', inverse_of: :tasks

      accepts_nested_attributes_for :subtasks

      delegate :description, to: :meta

      default_scope -> {asc :order}
    end
end
