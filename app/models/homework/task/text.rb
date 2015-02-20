module Homework
  module Task
    class Text < Base
      field :answer
      embedded_in :progress, :class_name => 'Homework::Progress'
    end
  end
end