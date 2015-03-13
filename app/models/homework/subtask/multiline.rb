module Homework
  module Subtask
    class Multiline < Base
      include Mongoid::Document
      field :lines, type: Array

     # belongs_to :meta, class_name: 'Homework::Meta::Subtask::Multiline'

      delegate :line_names, to: :meta
    end
  end
end