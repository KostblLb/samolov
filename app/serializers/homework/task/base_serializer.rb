class Homework::Task::BaseSerializer < ActiveModel::Serializer
  attributes :id, :_type, :type, :is_complete, :is_verified

  def type
    @object._type.demodulize
  end
end
