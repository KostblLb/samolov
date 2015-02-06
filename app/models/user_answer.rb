class UserAnswer
  include Mongoid::Document

  belongs_to :question
  belongs_to :answer
  belongs_to :quiz_progress
  belongs_to :student, class_name: 'User'

  validates_presence_of :question, :answer, :quiz_progress
  validate :answer_only_current_question, if: :new_record?
  validate :answer_belongs_to_question

  after_create :set_next_question

  delegate :is_correct, to: :answer

  private
  def answer_only_current_question
    errors[:question] << 'user can answer only current question' unless question == quiz_progress.current_question
  end

  def answer_belongs_to_question
    errors[:answer] << 'answer does not belongs to question' unless question == answer.question
  end

  def set_next_question
    quiz_progress.next_question!
  end
end