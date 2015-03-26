class GroupSerializer < ActiveModel::Serializer
  attributes :id, :teacher_id, :name, :education_beginning, :student_ids

  has_one :course
  has_one :scale
  has_many :adverts
  has_many :course_progresses
end
