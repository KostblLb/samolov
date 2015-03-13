class Homework::Subtask::PositionProfileSerializer < Homework::Subtask::BaseSerializer

  has_one :profile_compulsory, serializer: Homework::Subtask::ProfileSerializer
  has_one :profile_desirable, serializer: Homework::Subtask::ProfileSerializer
end