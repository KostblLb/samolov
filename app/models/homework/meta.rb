module Homework
  class Meta
    include Mongoid::Document

    field :name
    field :description, type: textarea

    embeds_many :meta_tasks
    belongs_to :progress
  end
end