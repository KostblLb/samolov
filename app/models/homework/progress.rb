module Homework
  class Progress
    include Mongoid::Document

    embeds_many :text_answers
    embeds_many :table_answers
    has_one :homework_meta, class_name: 'Homework::HomeworkMeta'
    belongs_to :unit_progress
    accepts_nested_attributes_for :text_answers
    accepts_nested_attributes_for :table_answers

    after_create :create_tasks

    def create_tasks
      homework_meta.tasks(self)
    end

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
  end
end