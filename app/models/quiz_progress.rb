class QuizProgress
  include Mongoid::Document

  belongs_to :quiz
  belongs_to :quiz_progress, class_name: 'UnitProgress', inverse_of: :quiz_progress
  belongs_to :case_progress, class_name: 'UnitProgress', inverse_of: :case_progress
  field :current_question

  has_many :user_answers

end