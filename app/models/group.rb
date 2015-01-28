class Group
  include Mongoid::Document

  belongs_to :course
  belongs_to :teacher, class_name: 'User'

  has_and_belongs_to_many :students, class_name: 'User', after_add: :create_course_progress_for_user

  after_save :resolve_students
  validates_presence_of :course, :teacher

  def name
    if persisted?
      "#{course.name} | #{teacher.name}"
    else
      'Новая группа'
    end
  end

  private
  def resolve_students
    if student_ids_changed?
      students.each {|s| create_course_progress_for_user(s) unless s.has_course?(course)}
    end
  end
  def create_course_progress_for_user(user)
    user.course_progresses.create course: course
  end
end
