class Homework::Subtask::PositionProfileSerializer < Homework::Subtask::BaseSerializer
  attributes :id, :description, :sex, :age, :appearance, :other_physical, :order, :type, :_type
end