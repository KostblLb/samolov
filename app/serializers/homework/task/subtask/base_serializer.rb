class Homework::Task::Subtask::BaseSerializer < ActiveModel::Serializer
  attributes :id, :_type, :type, :order
  def type
    @object._type.demodulize
  end
end
