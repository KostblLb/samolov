module Homework
  module Task
    class Multiline < Base
      include Mongoid::Document
      field :lines, type: Array
    end
  end
end