module Homework
  module Meta
    module Subtask
      class Text < Base
        include Mongoid::Document
        def build_subtsk
          super
          Homework::Subtask::Text.new description: description, order: order
        end
      end
    end
  end
end
