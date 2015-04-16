class GroupSerializer < ActiveModel::Serializer
  attributes :id, :teacher_id, :name, :education_beginning, :student_ids, :course_progress_ids

  has_one :course
  has_one :scale
  has_many :adverts
end
