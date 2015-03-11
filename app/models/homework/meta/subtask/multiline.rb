module Homework
  module Meta
    module Subtask
      class Multiline < Base
        include Mongoid::Document

        field :lines, type: Array

        def build_subtsk
          super
          Homework::Subtask::Multiline.new description: description, order: order
        end
      end
    end
  end
end