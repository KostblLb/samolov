module Homework
  module Subtask
    class Select < Base

      has_and_belongs_to_many :answers, class_name: 'Homework::Meta::Subtask::Option'

      delegate :options, :single, to: :meta

    end
  end
end