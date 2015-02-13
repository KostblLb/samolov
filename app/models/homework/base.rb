module Homework
  class Base
  include Mongoid::Document
    field :is_correct, type: Boolean
    field :comment, type: textarea
  end
end