class QuizProgress
  include Mongoid::Document

  belongs_to :quiz
  belongs_to :user
  belongs_to :quiz_progress_socket, class_name: 'UnitProgress', inverse_of: :quiz_progress
  belongs_to :case_progress_socket, class_name: 'UnitProgress', inverse_of: :case_progress
  belongs_to :current_question, class_name: 'Question'

  has_many :user_answers, dependent: :destroy

  before_create :set_current_question

  validates_presence_of :quiz

  def scale
    quiz_progress_socket.try(:scale) || case_progress_socket.try(:scale)
  end

  def next_question!

    return false if user_answers.where(question: current_question).empty?
    self.update! current_question_id: quiz.questions.where(:id.gt => current_question.id).first.try(:id)
    if current_question_id ==nil
      if quiz_progress_socket
        quiz_progress_socket.next_step
      else
        case_progress_socket.next_step
      end
    end
  end

  def correct_answers_count
    return 0 if current_question.present?
    user_answers.inject(0) {|sum, item| item.correct? ? sum + 1 : sum}
  end

  def points
    scale.points_for mistakes_count
  end

  def max_points
    scale.points_for 0 
  end

  def mistakes_count
    quiz.questions.count - correct_answers_count
  end

  private
  def set_current_question
    self.current_question = quiz.questions.first
    true
  end
end