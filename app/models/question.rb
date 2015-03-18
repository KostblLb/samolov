class Question
  include Mongoid::Document

  field :text

  belongs_to :quiz
  has_many :answers, dependent: :destroy
  has_many :user_answers, dependent: :destroy

  accepts_nested_attributes_for :answers
  delegate :preview_image, to: :quiz

  alias :name :text

  def number
    return 0 if quiz.nil?
    quiz.questions.index(self) + 1
  end

  def right_answers_count
    answers.right.count
  end

  def user_has_answer?(user)
    user_answers.where(user_id: user.id).count > 0
  end
end