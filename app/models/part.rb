class Part
  include Mongoid::Document
  field :name

  belongs_to :course

  has_many :units, dependent: :destroy
  has_many :course_part_progresses, dependent: :destroy

  accepts_nested_attributes_for :units

  validates_presence_of :name, :course
end
