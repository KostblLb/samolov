class Homework::Task::TextSerializer < ActiveModel::Serializer
  attributes :id, :description, :answer, :order, :type, :is_verified
end