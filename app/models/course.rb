class Course
  include Mongoid::Document

  field :name
  field :description
  field :cost, type: Float, default: 0

  has_many :course_progresses
  has_many :groups
  has_many :parts, dependent: :destroy


  accepts_nested_attributes_for :parts
  def group_for(user)
    return nil if user.nil?
    groups.where(student_ids: user.id).first
  end

  def status_for(user)
    return :in_progress if user && user.has_course?(self)
    :new
  end

  def duration
    parts.map(&:duration).inject(0) {|sum,x| sum + x }
  end
end
