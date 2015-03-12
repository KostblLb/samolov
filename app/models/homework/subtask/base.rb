module Homework
  module Subtask
    class Base
      include Mongoid::Document
      field :is_complete, type: Boolean, default: false


      embedded_in :task, class_name: 'Homework::Task', inverse_of: :subtasks
      belongs_to :meta, class_name: 'Homework::Meta::Subtask::Base'

      delegate :description, :order, to: :meta
    end
  end
end