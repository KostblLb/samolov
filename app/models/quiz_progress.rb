class QuizProgress
  include Mongoid::Document
  include PointsCounter

  field :current_question_number, type: Integer, default: 1

  belongs_to :quiz
  belongs_to :user
  belongs_to :quiz_progress_socket, class_name: 'UnitProgress', inverse_of: :quiz_progress
  belongs_to :case_progress_socket, class_name: 'UnitProgress', inverse_of: :case_progress
  belongs_to :current_question, class_name: 'Question'

  has_many :user_answers, dependent: :destroy

  delegate :unit, to: :quiz

  before_create :set_current_question

  validates_presence_of :quiz

  def scale
    quiz_progress_socket.try(:scale) || case_progress_socket.try(:scale)
  end

  def next_question!
    return false if user_answers.where(question: current_question).empty?
    self.update! current_question_id: quiz.questions.where(:position.gt => current_question.position).first.try(:id)
    current_question.nil? ? false : self.current_question_number += 1
  end

  def correct_answers_count
    return 0 if current_question.present?
    user_answers.inject(0) {|sum, item| item.correct? ? sum + 1 : sum}
  end

  def mistakes_count
    user_answers.inject(0) {|sum, item| sum + item.mistakes_count}
  end

  def finished?
    current_question.nil?
  end

  def quiz?
    self.quiz_progress_socket.present?
  end
  alias :is_quiz :quiz?

  def case?
    self.case_progress_socket.present?
  end
  alias :is_case :case?

  private
  def set_current_question
    self.current_question = quiz.questions.first
    true
  end
end