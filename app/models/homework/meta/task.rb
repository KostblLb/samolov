module Homework
  module Meta
    class Task
      include Mongoid::Document
      field :task_class

      embedded_in :meta, class_name: 'Homework::Meta::Base'
    end
  end
end