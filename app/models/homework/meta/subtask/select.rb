module Homework
  module Meta
    module Subtask
      class Select < Base
        field :single, type: Boolean, default: true

        has_many :options, class_name: 'Homework::Meta::Subtask::Option'

      end
    end
  end
end
