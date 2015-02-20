module Homework
  class MetaTask
    include Mongoid::Document
    field :task_class

    embedded_in :meta, class_name: 'Homework::Meta'
  end
end