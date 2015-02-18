module Homework
  class TextField < TaskBase
    field :answer
    embedded_in :homework_progress
  end
end