class CoursePartProgress
  include Mongoid::Document

  belongs_to :course_progress
  belongs_to :user
  belongs_to :part
  has_many :unit_progresses, dependent: :destroy

  after_create :create_ut_progresses

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

    event :activate do
      transition :disabled => :in_progress
    end

    event :complete do
      transition :in_progress => :done
    end

    before_transition on: :complete do |course_part_progress|
      course_part_progress.course_progress.resolve_state(course_part_progress)
    end
  end

  def resolve_state(unit_progress)
    next_unit = next_unit_progress(unit_progress)
    if next_unit
      next_unit.next_step
    else
      complete
    end
  end

  def next_unit_progress(unit_progress)
    next_unit = part.units.where(:position.gte => unit_progress.unit.position, :id.ne => unit_progress.unit).first
    if next_unit
      UnitProgress.disabled.where(unit: next_unit, user: user, state: 'disabled').first
    else
      nil
    end
  end

  def rebuild!
    part.units.each do |unit|
      unless user.has_unit?(unit)
        user.unit_progresses.create unit: unit, course_part_progress: self, user: user
      end
      user.unit_progress_by(unit).rebuild!
    end
  end

  def deadline
    unit_progresses.where(unit: part.units.last, user: user).first.deadline
  end

  private
  def create_ut_progresses
    part.units.each {|u| create_unit_progress(u) }
  end

  def create_unit_progress(unit)
    unit_progresses.create unit: unit, user: user
  end
end