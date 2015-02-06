class UnitProgress
  include Mongoid::Document

  belongs_to :course_part_progress
  has_one :quiz_progress, class_name: 'QuizProgress', inverse_of: :quiz_progress_socket, autobuild: true
  has_one :case_progress, class_name: 'QuizProgress', inverse_of: :case_progress_socket, autobuild: true
  belongs_to :unit
  after_create :create_quiz_progress

  private
  def create_quiz_progress
    quiz_progress.save
    case_progress.save
  end
end