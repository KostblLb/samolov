class Homework::Subtask::SelectSerializer < Homework::Subtask::BaseSerializer
  attributes :single, :name

  has_many :answers, serializer: Homework::Subtask::OptionSerializer
  has_many :options, serializer: Homework::Subtask::OptionSerializer
end
