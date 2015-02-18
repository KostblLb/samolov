module Homework
  class MetaTask
    include Mongoid::Document
    field :task_class
    field :description
    embedded_in :meta

  end
end