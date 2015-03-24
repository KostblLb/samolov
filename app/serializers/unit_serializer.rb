class UnitSerializer < ActiveModel::Serializer
  attributes :id, :name, :video_link, :summary, :part_id, :quiz_id, :case_id, :is_exam, :attachment_url, :position,
             :unit_progress_ids

  has_one :webinar
  has_one :my_progress

  def unit_progress_ids
    UnitProgress.where(unit: @object).only(:id).map &:id
  end

  def quiz_id
    @object.quiz.try :id
  end
  def case_id
    @object.case.try :id
  end
  def my_progress
    UnitProgress.where(user: @scope, unit: @object).first
  end
  def attachment_url
    @object.attachment.url
  end
end
