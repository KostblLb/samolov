class CoursePartProgress
  include Mongoid::Document

  belongs_to :course_progress
  has_many :unit_progresses, dependent: :destroy

  after_create :create_unit_progress

  private
  def create_unit_progress
    unit_progresses.create
  end
end