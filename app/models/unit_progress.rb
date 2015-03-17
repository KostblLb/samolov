class UnitProgress
  include Mongoid::Document

  belongs_to :course_part_progress
  belongs_to :user

  has_one :quiz_progress, class_name: 'QuizProgress', inverse_of: :quiz_progress_socket, dependent: :destroy
  has_one :case_progress, class_name: 'QuizProgress', inverse_of: :case_progress_socket, dependent: :destroy
  has_one :homework_progress, class_name: 'Homework::Progress', dependent: :destroy

  belongs_to :unit

  before_create :set_init_state_for_exam
  after_create :create_quiz_progress, :create_homework_prog

  delegate :scale, :teacher, to: :course_part_progress
  delegate :is_exam, to: :unit


  state_machine :initial => :video do

    state :video

    state :quiz

    state :summary

    state :case

    state :webinar

    state :homework

    event :next_step do
      transition :video => :quiz, :quiz => :summary, :summary => :case, :case => :webinar, :webinar => :homework
    end
  end

  def max_points
    safe_get_points :max_points
  end

  def points
    safe_get_points :points
  end

  def hpid
    homework_progress.id
  end
  private

  def set_init_state_for_exam
    self.state = 'case' if is_exam
  end

  def safe_get_points(method)
    quiz_points = quiz_progress.try(method) || 0
    case_points = case_progress.try(method) || 0
    result = quiz_points + case_points
    is_exam ? result * 2 : result
  end

  def create_quiz_progress
    unit.quiz.quiz_progresses.create user: user, quiz_progress_socket: self if unit.quiz.present?
    unit.case.quiz_progresses.create user: user, case_progress_socket: self if unit.case.present?
  end

  def create_homework_prog
    unit.homework_meta.create_homework_prog(self) unless unit.homework_meta.nil? if unit.homework_meta.present?
  end
end