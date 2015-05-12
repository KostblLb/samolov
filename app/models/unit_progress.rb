class UnitProgress
  include Mongoid::Document

  field :webinar_score, type: Integer

  field :video_complete, type: Boolean, default: false
  field :summary_complete, type: Boolean, default: false
  field :webinar_complete, type: Boolean, default: false

  belongs_to :course_part_progress
  belongs_to :user

  has_one :quiz_progress, class_name: 'QuizProgress', inverse_of: :quiz_progress_socket, dependent: :destroy
  has_one :case_progress, class_name: 'QuizProgress', inverse_of: :case_progress_socket, dependent: :destroy
  has_one :homework_progress, class_name: 'Homework::Progress', dependent: :destroy

  belongs_to :unit

  after_create :create_quiz_progress, :create_homework_prog

  delegate :scale, :teacher, to: :course_part_progress
  delegate :is_exam, :name, to: :unit

  def max_points
    safe_get_points(:max_points)
  end

  def points
    safe_get_points(:points)
  end

  def hpid
    homework_progress.id
  end

  def homework_complete
    if homework_progress != nil
      homework_progress.complete?
    end
  end

  def quiz_complete
    if quiz_progress !=nil
      quiz_progress.finished?
    end

  end
  def case_complete
    if !is_exam && case_progress != nil
      case_progress.finished?
    end

  end

  def max_webinar_points
    is_exam ? 15 : 5
  end

  def rebuild!
    unless unit.quiz.nil?
      unit.quiz.quiz_progresses.create user: user, quiz_progress_socket: self unless user.has_quiz?(unit.quiz)
    end
    unless unit.case.nil?
      unit.case.quiz_progresses.create user: user, case_progress_socket: self unless user.has_quiz?(unit.case)
    end
    if homework_progress.nil?
      unit.homework_meta.create_homework_prog(self, user) unless unit.homework_meta.nil?
    else
      if homework_progress.in_progress?
        homework_progress.delete
        unit.homework_meta.create_homework_prog(self, user)
      end
    end
  end

  def schedule
    course_part_progress.course_progress.group.unit_schedules.where(unit: unit).first
  end

  def webinar
    schedule.webinar
  end

  def webinar_beginning
    webinar.start
  end

  def unit_beginning
    schedule.start_date
  end

  def quiz_deadline
    webinar.start
  end
  alias :case_deadline :quiz_deadline

  def webinar_deadline
    webinar.start + 3.hours
  end

  def homework_deadline
    schedule.end_date + 7
  end

  def deadline
    schedule.end_date
  end
  
  private
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
    unit.homework_meta.create_homework_prog(self, user) unless unit.homework_meta.nil? if unit.homework_meta.present?
  end
end