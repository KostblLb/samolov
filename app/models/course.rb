class Course
  include Mongoid::Document
  field :name
  field :description

  def status_for(user)
    :new
  end
end
