module Homework
  module Meta
    class Progress
      include Mongoid::Document
      embeds_many :meta_bases, class_name: 'Homework::Meta::Base'
      belongs_to :unit, inverse_of: :homework_meta

      accepts_nested_attributes_for :meta_bases

      def build_homework_prog(unit_progress)
        progress = Homework::Progress.new unit_progress: unit_progress
        meta_bases.each do |meta_task|
          meta_task.build_t(progress)
        end
      end
    end
  end
end