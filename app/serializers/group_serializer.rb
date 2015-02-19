class GroupSerializer < ActiveModel::Serializer
  attributes :id, :teacher_id, :name

  has_one :course
  has_many :adverts
  has_many :students
  has_many :course_progresses
end
