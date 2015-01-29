class Unit
  include Mongoid::Document

  field :name
  field :video_link
  field :summary

  belongs_to :part

  validates_presence_of :name, :summary
end
