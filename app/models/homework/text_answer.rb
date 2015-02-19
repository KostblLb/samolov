module Homework
  class TextAnswer < TaskBase
    field :answer
    embedded_in :progress, :class_name => 'Homework::Progress'
  end
end