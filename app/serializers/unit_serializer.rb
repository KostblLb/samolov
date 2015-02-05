class UnitSerializer < ActiveModel::Serializer
  attributes :id, :name, :video_link, :summary, :part_id, :quiz_id, :case_id

  has_one :webinar
  # has_one :test
  # has_one :case
  def quiz_id
    @object.quiz.try :id
  end
  def case_id
    @object.case.try :id
  end
end
