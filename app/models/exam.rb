class Exam
  include Mongoid::Document

  field :name
  field :is_test, type: Boolean

  belongs_to :unit
  has_many :questions, dependent: :destroy
end