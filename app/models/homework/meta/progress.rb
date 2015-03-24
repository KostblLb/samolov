module Homework
  module Meta
    class Progress
      include Mongoid::Document

      field :name

      has_many :tasks, class_name: 'Homework::Meta::Task'
      has_many :units, inverse_of: :homework_meta

      #accepts_nested_attributes_for :meta_bases

      def build_homework_prog(unit_progress, student)
        progress = Homework::Progress.new unit_progress: unit_progress, name: name, student: student
        tasks.each do |meta_task|
          progress.tasks << meta_task.build_instance
        end
        progress
      end
      def create_homework_prog(unit_progress, student)
        build_homework_prog(unit_progress, student).save
      end
    end
  end
end