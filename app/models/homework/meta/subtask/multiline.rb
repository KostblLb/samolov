module Homework
  module Meta
    module Subtask
      class Multiline < Base
        include Mongoid::Document
        field :line_names, type: Array
        field :lines, type: Array

        def build_instance
          instance = super
          instance.lines = lines
          instance
        end
      end
    end
  end
end