class UnitProgress
  include Mongoid::Document

  belongs_to :course_part_progress
  belongs_to :user
  has_one :quiz_progress, class_name: 'QuizProgress', inverse_of: :quiz_progress_socket, dependent: :destroy
  has_one :case_progress, class_name: 'QuizProgress', inverse_of: :case_progress_socket, dependent: :destroy
  belongs_to :unit
  after_create :create_quiz_progress

  delegate :scale, to: :course_part_progress

  private
  def create_quiz_progress
    unit.quiz.quiz_progresses.create user: user, quiz_progress_socket: self
    unit.quiz.quiz_progresses.create user: user, case_progress_socket: self
  end
end