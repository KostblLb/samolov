class UnitProgress
  include Mongoid::Document

  belongs_to :course_part_progress
  belongs_to :user

  has_one :quiz_progress, class_name: 'QuizProgress', inverse_of: :quiz_progress_socket, dependent: :destroy
  has_one :case_progress, class_name: 'QuizProgress', inverse_of: :case_progress_socket, dependent: :destroy
  has_one :homework_progress, class_name: 'Homework::Progress', dependent: :destroy

  belongs_to :unit

  after_create :create_quiz_progress
  after_create :create_homework_prog

  delegate :scale, to: :course_part_progress
  


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

  def safe_get_points(method)
    quiz_points = quiz_progress.try(method) || 0
    case_points = case_progress.try(method) || 0
    quiz_points + case_points
  end

  def create_quiz_progress
    unit.quiz.quiz_progresses.create user: user, quiz_progress_socket: self
    unit.case.quiz_progresses.create user: user, case_progress_socket: self
  end


  def create_homework_prog
    unit.homework_meta.create_homework_prog(self) unless unit.homework_meta.nil?
  end
end