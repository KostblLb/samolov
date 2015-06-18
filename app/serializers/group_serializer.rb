class GroupSerializer < ActiveModel::Serializer
  attributes :id, :teacher_id, :name, :education_beginning, :student_ids, :course_progress_ids, :unit_progress_ids

  has_one :course
  has_one :scale
  has_many :adverts

  def unit_progress_ids
    @object.unit_progresses.distinct :id
  end
end
