class CoursePartProgress
  include Mongoid::Document

  belongs_to :course_progress
  belongs_to :user
  belongs_to :part
  has_many :unit_progresses, dependent: :destroy

  after_create :create_ut_progresses
  after_save :resolve_state

  delegate :scale, to: :course_progress
  delegate :teacher, to: :course_progress

  def max_points
    unit_progresses.inject(0) {|sum, u| sum + u.max_points}
  end

  def points
    unit_progresses.inject(0) {|sum, u| sum + u.points}
  end

  state_machine :initial => :disabled do
    state :disabled

    state :in_progress

    state :done
  end

  def resolve_state
    if state=='done'
      next_part=course_progress.course_part_progresses.find_by(part.position+1)
      if next_part
        next_part.state = 'in_progress'
      else
        course_progress.is_complete = true
      end
    end
  end

  private
  def create_ut_progresses
    part.units.each {|u| create_unit_progress(u) }
  end
  def create_unit_progress(unit)
    unit_progresses.create unit: unit, user: user
  end
end