class GroupSerializer < ActiveModel::Serializer
  attributes :id, :teacher_id, :name, :student_ids, :course_progress_ids

  has_one :course
  has_one :scale
  has_many :adverts
  # has_many :students
  # has_many :course_progresses
end
