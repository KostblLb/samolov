module Homework
  module Meta
    module Subtask
      class PositionProfile < Base
        include Mongoid::Document
        def build_subtsk
          super
          Homework::Subtask::PositionProfile.new description: description, order: order
        end
      end
    end
  end
end
