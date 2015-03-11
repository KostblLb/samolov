class Homework::Subtask::BaseSerializer < ActiveModel::Serializer
  attributes :id, :_type, :type, :order, :description
  def type
    @object._type.demodulize
  end
end
