class Exam
  include Mongoid::Document

  field :name
  belongs_to :unit, inverse_of: :first_test
  belongs_to :unit, inverse_of: :second_test
  has_many :exam_progresses, dependent: :destroy
  has_many :questions, dependent: :destroy
end