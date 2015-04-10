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
  delegate :is_exam, :name, to: :unit

  state_machine :initial => :video do

    state :video

    state :quiz

    state :summary

    state :case

    state :webinar

    state :homework

    state :done

    event :next_step do
      transition :case => :webinar, :webinar => :done, :if => :is_exam

      transition :video => :quiz, :quiz => :summary, :summary => :case, :case => :webinar,
               :webinar => :homework, :homework => :done, :unless => :is_exam
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
      if !homework? && homework_progress.in_progress?
        homework_progress.delete
        unit.homework_meta.create_homework_prog(self, user)
      end
    end
  end

  def unit_beginning
    course_part_progress.part_beginning + course_part_progress.part
                                           .units
                                           .where(:position.lte => unit.position, :id.lt => unit.id)
                                           .map(&:duration).inject(0) {|sum,x| sum + x }
  end

  def video_deadline
    unit_beginning + unit.estimate.video
  end

  def quiz_deadline
    video_deadline + unit.estimate.test
  end

  def summary_deadline
    quiz_deadline + unit.estimate.summary
  end

  def case_deadline
    summary_deadline + unit.estimate.case
  end

  def webinar_deadline
    case_deadline + 1
  end

  def homework_deadline
    webinar_deadline + unit.estimate.homework
  end
  alias :deadline :homework_deadline
  
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
    unit.homework_meta.create_homework_prog(self, user) unless unit.homework_meta.nil? if unit.homework_meta.present?
  end
end