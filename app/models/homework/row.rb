module Homework
  class Row
    include Mongoid::Document
    field :row, type: Array
  end
end
