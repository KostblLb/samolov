module Homework
  class MetaTask
    include Mongoid::Document
    field :task
    embedded_in :meta
  end
end