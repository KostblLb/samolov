class Question
  include Mongoid::Document

  field :text

  belongs_to :quiz
  has_many :answers, dependent: :destroy
  has_many :user_answers, dependent: :destroy

  accepts_nested_attributes_for :answers

  alias :name :text
end