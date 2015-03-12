module Homework
  module Subtask
    class Multiline < Base
      include Mongoid::Document
      field :lines, type: Array

      belongs_to :multiline_meta, class_name: 'Homework::Meta::Subtask::Multiline'

      delegate :line_names, to: :multiline_meta
    end
  end
end