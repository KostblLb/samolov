class Group
  include Mongoid::Document

  belongs_to :course
  belongs_to :teacher, class_name: 'User'

  has_and_belongs_to_many :students, class_name: 'User'

  validates_presence_of :course, :teacher

  def name
    "#{course.name} | #{teacher.name}"
  end
end
