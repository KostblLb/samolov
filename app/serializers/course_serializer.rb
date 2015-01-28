class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :status

  def status
    @object.status_for @scope
  end
end
