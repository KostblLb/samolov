class PartSerializer < ActiveModel::Serializer
  attributes :id, :name, :course_id, :unit_ids

  has_one :my_progress

  def my_progress
    CoursePartProgress.where(part: @object, user: @scope).first
  end
end
