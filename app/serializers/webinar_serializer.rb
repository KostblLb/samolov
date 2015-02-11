class WebinarSerializer < ActiveModel::Serializer
  attributes :id, :link, :start, :end, :video
end
