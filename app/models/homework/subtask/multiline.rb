module Homework
  module Subtask
    class Multiline < Base
      include Mongoid::Document
      field :lines, type: Array
      field :line_names, type: Array
    end
  end
end