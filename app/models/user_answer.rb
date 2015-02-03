class UserAnswer
  include Mongoid::Document

  belongs_to :question
  has_many :answers

end