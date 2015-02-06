class CoursePartProgress
  include Mongoid::Document

  belongs_to :course_progress
  belongs_to :student, class_name: 'User'
  belongs_to :part
  has_many :unit_progresses, dependent: :destroy

  after_create :create_ut_progresses

  private
  def create_ut_progresses
    part.units.each {|u| create_unit_progress(u) }
  end
  def create_unit_progress(unit)
    unit_progresses.create unit: unit, student: student
  end
end