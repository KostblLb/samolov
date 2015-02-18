class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :status, :my_group_id, :part_ids, :cost

  has_one :my_progress

  def status
    @object.status_for @scope
  end

  def my_group_id
    @object.group_for(@scope).try(:id)
  end

  def my_progress
    CourseProgress.where(course: @object, user: @scope).first
  end
end
