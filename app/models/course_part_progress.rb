class CoursePartProgress
  include Mongoid::Document

  belongs_to :course_progress
  belongs_to :user
  belongs_to :part
  has_many :unit_progresses, dependent: :destroy

  after_create :create_ut_progresses

  delegate :scale, to: :course_progress

  def max_points
    unit_progresses.inject(0) {|sum, u| sum + u.max_points}
  end

  def points
    unit_progresses.inject(0) {|sum, u| sum + u.points}
  end


  private
  def create_ut_progresses
    part.units.each {|u| create_unit_progress(u) }
  end
  def create_unit_progress(unit)
    unit_progresses.create unit: unit, user: user
  end
end