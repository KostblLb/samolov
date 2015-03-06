module Homework
  module Meta
    class Progress
      include Mongoid::Document

      field :name

      has_many :meta_bases, class_name: 'Homework::Meta::Base'
      belongs_to :unit, inverse_of: :homework_meta

      #accepts_nested_attributes_for :meta_bases

      def build_homework_prog(unit_progress)
        progress = Homework::Progress.new unit_progress: unit_progress, name: name
        meta_bases.each do |meta_task|
          progress.tasks << meta_task.build_t
        end
        progress
      end
      def create_homework_prog(unit_progress)
        build_homework_prog(unit_progress).save
      end
    end
  end
end