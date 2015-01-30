class Unit
  include Mongoid::Document

  field :name
  field :video_link
  field :summary

  embeds_one :webinar

  belongs_to :part

  accepts_nested_attributes_for :webinar

  validates_presence_of :name, :summary
end
