class UnitProgress
  include Mongoid::Document

  field :webinar_score, type: Integer
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

  scope :disabled, -> {where state: 'disabled'}

  state_machine :initial => :disabled do

    state :disabled

    state :video

    state :quiz

    state :summary

    state :case

    state :webinar

    state :homework

    state :done

    event :next_step do
      transition :disabled => :video, :video => :quiz, :quiz => :summary, :summary => :case, :case => :webinar,
                 :webinar => :homework, :homework => :done
    end

    before_transition :homework => :done do |unit_progress|
        unit_progress.course_part_progress.resolve_state(unit_progress)
    end

  end

  def max_points
    safe_get_points(:max_points)
  end

  def points
    safe_get_points(:points)
  end

  def hpid
    homework_progress.id
  end

  def max_webinar_points
    is_exam ? 15 : 5
  end
  
  private
  def set_init_state_for_exam
    self.state = 'case' if is_exam
  end

  def safe_get_points(method)
    quiz_points     = quiz_progress.try(method) || 0
    case_points     = case_progress.try(method) || 0
    homework_points = homework_progress.try(method) || 0
    webinar_points = method.to_s == 'max_points' ? max_webinar_points : (webinar_score || 0)
    quiz_points + case_points + homework_points + webinar_points
  end

  def create_quiz_progress
    unit.quiz.quiz_progresses.create user: user, quiz_progress_socket: self if unit.quiz.present?
    unit.case.quiz_progresses.create user: user, case_progress_socket: self if unit.case.present?
  end

  def create_homework_prog
    unit.homework_meta.create_homework_prog(self) unless unit.homework_meta.nil? if unit.homework_meta.present?
  end

  def rebuild!
    unit.quiz.quiz_progresses.create user: user, quiz_progress_socket: self unless user.has_quiz?(unit.quiz)
    unit.quiz.quiz_progresses.create user: user, case_progress_socket: self unless user.has_quiz?(unit.case)
    if homework_progress.exists? && !homework? && !homework_progress.in_progress?
      unit.homework_meta.create_homework_prog(self)
    end
  end
end