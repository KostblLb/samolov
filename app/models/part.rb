class Part
  include Mongoid::Document
  field :name

  belongs_to :course

  validates_presence_of :name, :course
end
