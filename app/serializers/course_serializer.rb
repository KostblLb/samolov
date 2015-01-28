class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :status, :my_group_id

  def status
    @object.status_for @scope
  end

  def my_group_id
    @object.group_for(@scope).try(:id)
  end
end
