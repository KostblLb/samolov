class UnitSchedule
  include Mongoid::Document

  field :start_date, type: Date
  field :end_date, type: Date

  belongs_to :unit

  embedded_in :group

  embeds_one :webinar
  accepts_nested_attributes_for :webinar

  after_create :create_webinar
  private
  def create_webinar
    webinar.create start: start_date + unit.estimate.video + unit.estimate.test + unit.estimate.summary + unit.estimate.case + 12.hours
  end
end