module Homework
  module Meta
    module Subtask
      class Text < Base
        include Mongoid::Document
        def build_subtsk
          super
          Homework::Task::Subtask::Text.new description: description, order: order
        end
      end
    end
  end
end