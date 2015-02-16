module Homework
  class Progress
    include Mongoid::Document

    embeds_one :base
    has_one :meta
    belongs_to :unit_progress
  end
end