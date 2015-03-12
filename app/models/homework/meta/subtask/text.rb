module Homework
  module Meta
    module Subtask
      class Text < Base
        include Mongoid::Document
        def build_instance
          super
          Homework::Subtask::Text.new
        end
      end
    end
  end
end
