module Homework
  module Subtask
    class Multiline < Base
      include Mongoid::Document
      field :lines, type: Array

      delegate :line_names, to: :meta
    end
  end
end