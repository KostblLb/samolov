module Homework
  class Progress
    include Mongoid::Document

    belongs_to :teacher, class_name: 'User', inverse_of: :students_homeworks
    belongs_to :student, class_name: 'User', inverse_of: :my_homeworks
    belongs_to :unit_progress, class_name: 'UnitProgress', inverse_of: :homework_progress

    embeds_many :text_answers
    embeds_many :table_answers

    has_one :homework_meta, class_name: 'Homework::HomeworkMeta'

    accepts_nested_attributes_for :text_answers
    accepts_nested_attributes_for :table_answers

    after_create :create_tasks



    def max_points
      (text_answers.size + table_answers.size)*5
    end

    def correct_answer_counter
      text_answers.where(is_correct: true).size+table_answers.where(is_correct: true).size
    end

    def mistakes_counter
      max_points/5 - correct_answer_counter
    end

    def points
      correct_answer_counter*5
    end

    private
      def create_tasks
        homework_meta.tasks(self)
      end
  end
end