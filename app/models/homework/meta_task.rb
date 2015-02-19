module Homework
  class MetaTask
    include Mongoid::Document
    field :task_class
    embedded_in :homework_meta

  end
end