class Homework::Task::BaseSerializer < ActiveModel::Serializer
  attributes :id, :_type, :type

  def type
    @object._type.demodulize
  end
end
