module Homework
  class TaskBase
    include Mongoid::Document
    field :is_correct, type: Boolean
    field :comment
    field :description
    embedded_in :progress
  end
end