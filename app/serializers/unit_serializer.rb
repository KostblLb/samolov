class UnitSerializer < ActiveModel::Serializer
  attributes :id, :name, :video_link, :summary, :part_id, :first_test_id, :second_test_id

  has_one :webinar
end
