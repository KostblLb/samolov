class Group
  include Mongoid::Document

  field :name

  belongs_to :course
  belongs_to :teacher, class_name: 'User', inverse_of: :trained_groups
  belongs_to :scale

  embeds_many :adverts

  has_and_belongs_to_many :students, class_name: 'User', after_add: :create_course_progress_for_user, inverse_of: :groups

  after_initialize :set_default_scale
  after_save :resolve_students
  validates_presence_of :course, :teacher, :scale

  accepts_nested_attributes_for :adverts

  def name
    if persisted?
      super || "#{course.name} | #{teacher.name}"
    else
      'Новая группа'
    end
  end

  private
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
