module Homework
  class Progress
    include Mongoid::Document

    field :name

    belongs_to :teacher, class_name: 'User', inverse_of: :students_homeworks
    belongs_to :student, class_name: 'User', inverse_of: :my_homeworks
    belongs_to :unit_progress, class_name: 'UnitProgress', inverse_of: :homework_progress

    # embeds_many :text_answers, class_name: 'Homework::Task::Text'
    # embeds_many :table_answers, class_name: 'Homework::Task::Table'
    embeds_many :tasks, class_name: 'Homework::Task::Base', inverse_of: :progress

    accepts_nested_attributes_for :tasks#, update_only: true
  #  accepts_nested_attributes_for :table_answers

    def total_tasks
      tasks.size
    end
    def max_points
      total_tasks*5
    end

    def correct_answer_counter
      tasks.where(is_correct: true).size
    end

    def mistakes_counter
      max_points/5 - correct_answer_counter
    end

    def points
      correct_answer_counter*5
    end

    private
      def create_tasks
        homework_metas.each do |meta|
          meta.create_tasks_by_meta(self, meta)
        end
      end
  end
end