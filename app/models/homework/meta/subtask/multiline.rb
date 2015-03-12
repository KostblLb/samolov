module Homework
  module Meta
    module Subtask
      class Multiline < Base
        include Mongoid::Document
        field :line_names, type: Array
        field :lines, type: Array

        def build_subtsk
          super
          Homework::Subtask::Multiline.new description: description, order: order, lines: lines, line_names: line_names
        end
      end
    end
  end
end