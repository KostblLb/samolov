class Course
  include Mongoid::Document
  field :name
  field :description

  has_many :course_progresses
  has_many :groups

  def group_for(user)
    groups.where(student_ids: user.id).first
  end

  def status_for(user)
    return :in_progress if user.has_course? self
    :new
  end
end
