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

    event :close do
      transition :in_progress => :done
    end

    before_transition on: :close do |course_part_progress|

    end
  end

  def resolve_state(position)
    next_unit_progress = next_unit_progress(position)
    if next_unit_progress
      next_unit_progress.activate
    else
      close
    end

    if done?
      next_part = course_progress.course_part_progresses.find_by(part.position + 1)
      if next_part
        next_part.next_step
      else
        course_progress.is_complete = true
      end
    end
  end

  def next_unit_progress(position)
    unit = part.units.where(:position.gte => position).first
    if unit.nil?
      progress = UnitProgress.where(unit: next_unit, user: user).first
    else
      progress = nil
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