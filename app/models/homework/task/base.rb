module Homework
  module Task
    class Base
      include Mongoid::Document
      field :is_correct, type: Boolean, default: false
      field :comment
      field :description
      field :order, type: Integer
      field :is_verified, type: Boolean, default: false



      embedded_in :progress, class_name: 'Homework::Progress', inverse_of: :tasks
    end
  end
end