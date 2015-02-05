class UserAnswer
  include Mongoid::Document

  belongs_to :question
  belongs_to :answer
  belongs_to :quiz_progress

end