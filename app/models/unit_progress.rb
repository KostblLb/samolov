class UnitProgress
  include Mongoid::Document

  belongs_to :course_part_progress
  belongs_to :user
  has_one :quiz_progress, class_name: 'QuizProgress', inverse_of: :quiz_progress_socket, dependent: :destroy
  has_one :case_progress, class_name: 'QuizProgress', inverse_of: :case_progress_socket, dependent: :destroy
  belongs_to :unit
  has_one :homework_progress, class_name: 'Homework::Progress', dependent: :destroy
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
    quiz_points = quiz_progress.try(:max_points) || 0
    case_points = case_progress.try(:max_points) || 0
    quiz_points + case_points
  end

  def points
    quiz_progress.points + case_progress.points
  end

  private
  def create_quiz_progress
    unit.quiz.quiz_progresses.create user: user, quiz_progress_socket: self
    unit.case.quiz_progresses.create user: user, case_progress_socket: self
  end
  def create_homework_prog
    create_homework_progress homework_meta: unit.homework
  end
end