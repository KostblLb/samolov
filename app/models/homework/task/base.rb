module Homework
  module Task
    class Base
      include Mongoid::Document
      field :is_correct, type: Boolean
      field :comment
      field :description
    end
  end
end