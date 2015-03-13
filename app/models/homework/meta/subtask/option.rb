module Homework
  module Meta
    module Subtask
      class Option
        include Mongoid::Document

        field :answer
        belongs_to :select, class_name: 'Homework::Meta::Subtask::Select'
      end
    end
  end
end
