module Homework
  module Task
    class Task
      include Mongoid::Document

      field :is_correct, type: Boolean, default: false
      field :comment
      field :description
      field :order, type: Integer

      embeds_many :subtasks, class_name: 'Homework::Task::Subtask::Base'

      embedded_in :progress, class_name: 'Homework::Progress', inverse_of: :tasks

      accepts_nested_attributes_for :subtasks
    end
  end
end
