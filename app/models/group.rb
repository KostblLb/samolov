class Group
  include Mongoid::Document

  field :name
  field :education_beginning, type: Date

  belongs_to :course
  belongs_to :teacher, class_name: 'User', inverse_of: :trained_groups
  belongs_to :scale

  embeds_many :adverts
  embeds_many :unit_schedules

  has_and_belongs_to_many :students, class_name: 'User', after_add: :create_course_progress_for_user, inverse_of: :groups
  has_many :course_progresses, dependent: :destroy

  after_initialize :set_default_scale
  before_create :set_schedule
  after_save :resolve_students
  validates_presence_of :course, :scale, :teacher, :education_beginning
  validate :cannot_be_a_student

  accepts_nested_attributes_for :adverts, :unit_schedules, allow_destroy: true

  def name
    if persisted?
      super || "#{course.name} | #{teacher.name}"
    else
      'Новая группа'
    end
  end

  def cannot_be_a_student
    errors.add(:teacher, "can not be a student") if students.include?(teacher)
  end

  def rebuild!
    students.each do |student|
      unless student.has_course?(course)
        student.course_progresses.create course: course, group: self, user: student
      end
      student.course_progress_by(course).rebuild!
    end
    set_schedule
  end

  private
  def set_schedule
    beginning = education_beginning
    course.parts.each do |part|
      part.units.each do |unit|
        schedule = unit_schedules.where(unit: unit).first
        if schedule.nil?
          unit_schedules << UnitSchedule.new(start_date: beginning, end_date: beginning + 7, unit: unit,
                                           webinar: Webinar.new(start: beginning + 4 + 12.hours))
        end
        beginning += 7
      end
    end
  end

  def set_default_scale
    self.scale ||= Scale.default
  end

  def resolve_students
    if student_ids_changed?
      students.each {|s| create_course_progress_for_user(s) unless s.has_course?(course)}
    end
  end

  def create_course_progress_for_user(user)
    user.course_progresses.create course: course, group: self, user: user
  end
end
