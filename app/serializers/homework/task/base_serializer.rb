class Homework::Task::BaseSerializer < ActiveModel::Serializer
  attributes :id, :_type, :type, :is_complete

  def type
    @object._type.demodulize
  end
end
