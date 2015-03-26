class Part
  include Mongoid::Document
  field :name

  field :position, type: Integer, default: 1
  belongs_to :course

  has_many :units, dependent: :destroy
  has_many :course_part_progresses, dependent: :destroy

  accepts_nested_attributes_for :units

  validates_presence_of :name, :course

  default_scope -> {asc :position}

  def duration
    units.map(&:duration).inject(0) {|sum,x| sum + x }
  end
end
