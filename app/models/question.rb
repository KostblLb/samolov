class Question
  include Mongoid::Document

  field :text
  field :position, type: Integer

  belongs_to :quiz
  has_many :answers, dependent: :destroy
  has_many :user_answers, dependent: :destroy

  accepts_nested_attributes_for :answers
  delegate :preview_image, to: :quiz

  alias :name :text

  before_create :set_next_position

  validates_uniqueness_of :position, :scope => [:quiz]

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

  def set_next_position
    last_position = quiz.questions.max(:position)
    self.position = last_position.nil? ? 1 : last_position + 1
  end
end