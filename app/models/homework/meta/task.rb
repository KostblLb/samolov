module Homework
  module Meta
    class Task
      include Mongoid::Document

      field :description
      field :order, type: Integer

      has_many :subtasks, class_name: 'Homework::Meta::Subtask::Base'

      belongs_to :meta, class_name: 'Homework::Meta::Progress'

      def build_t
        build_all = []
        subtasks.each do |subtask|
          build_all << subtask.build_t
        end
        build_all
      end
    end
  end
end
