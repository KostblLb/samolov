class UserAnswer
  include Mongoid::Document

  belongs_to :question
  belongs_to :quiz_progress
  belongs_to :user

  has_and_belongs_to_many :answers

  validates_presence_of :question, :quiz_progress
  validate :answer_only_current_question, if: :new_record?
  validate :answer_belongs_to_question

  after_create :set_next_question

  def correct?
    answers.right.count == question.right_answers_count
  end
  alias :is_correct :correct?

  def mistakes_count
    answers.incorrect.count
  end

  private
  def answer_only_current_question
    errors[:question] << 'user can answer only current question' unless question == quiz_progress.current_question
  end

  def answer_belongs_to_question
    answers.each do |answer|
      errors[:answers] << 'answer does not belongs to question' unless question == answer.question
      return false
    end
    true
  end

  def set_next_question
    quiz_progress.next_question!
  end
end