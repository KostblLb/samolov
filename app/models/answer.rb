class Answer
  include Mongoid::Document

  field :text
  field :is_correct, type: Boolean
  field :position, type: Integer, default: 1

  belongs_to :question
  has_and_belongs_to_many :user_answers

  index({ position: 1 }, { unique: true})
  default_scope -> { asc(:poistion).asc(:id) }
  scope :right, -> {where is_correct: true}
  scope :incorrect, -> {where is_correct: false}

  def dup
    Answer.new(text: text, is_correct: is_correct)
  end

end