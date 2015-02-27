module Homework
  module Task
    class Base
      include Mongoid::Document
      field :is_correct, type: Boolean
      field :comment
      field :description
      field :order, type: Integer
      field :type
      field :is_verified, type: Boolean


      embedded_in :progress, class_name: 'Homework::Progress', inverse_of: :tasks
    end
  end
end