class Question
  include Mongoid::Document

  field :text
  field :position, type: Integer, default: 1

  belongs_to :quiz
  has_many :answers, dependent: :destroy
  has_many :user_answers, dependent: :destroy

  accepts_nested_attributes_for :answers
  delegate :preview_image, to: :quiz

  alias :name :text

  index({ position: 1 }, { unique: true})
  default_scope -> { asc(:position).asc(:id) }

  def right_answers_count
    answers.right.count
  end

  def user_has_answer?(user)
    user_answers.where(user_id: user.id).count > 0
  end

  def dup
    new_answers = []
    answers.each {|answer| new_answers << answer.dup}
    Question.new(text: text, answers: new_answers)
  end
end