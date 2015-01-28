class Course
  include Mongoid::Document
  field :name
  field :description

  has_many :course_progresses

  def status_for(user)
    :in_progress if user.has_course self
    :new
  end
end
