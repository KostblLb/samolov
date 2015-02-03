class Question
  include Mongoid::Document

  field :text

  belongs_to :exam
  has_many :answers, dependent: :destroy
end