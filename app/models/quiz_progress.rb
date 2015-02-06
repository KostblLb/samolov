class QuizProgress
  include Mongoid::Document

  belongs_to :quiz
  belongs_to :student, class_name: 'User'
  belongs_to :quiz_progress_socket, class_name: 'UnitProgress', inverse_of: :quiz_progress
  belongs_to :case_progress_socket, class_name: 'UnitProgress', inverse_of: :case_progress
  belongs_to :current_question, class_name: 'Question'

  has_many :user_answers

  before_create :set_current_question

  validates_presence_of :quiz

  def next_question!
    return false if user_answers.where(question: current_question).empty?
    self.update! current_question: quiz.questions.where(:id.gt => current_question.id).first
  end

  def correct_answers_count
    return nil if current_question.present?
    user_answers.inject(0) {|sum, item| item.is_correct ? sum + 1 : sum}
  end

  private
  def set_current_question
    self.current_question = quiz.questions.first
    true
  end
end