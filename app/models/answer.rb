class Answer
  include Mongoid::Document

  field :text
  field :is_correct, type: Boolean

  belongs_to :question
  has_and_belongs_to_many :user_answers

  scope :right, -> {where is_correct: true}
  scope :incorrect, -> {where is_correct: false}

end