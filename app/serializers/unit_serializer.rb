class UnitSerializer < ActiveModel::Serializer
  attributes :id, :name, :video_link, :summary, :part_id

  has_one :webinar
end
