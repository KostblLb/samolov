class Question
  include Mongoid::Document

  field :text

  belongs_to :quiz
  has_many :answers, dependent: :destroy
end