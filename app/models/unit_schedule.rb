class UnitSchedule
  include Mongoid::Document

  field :start_date, type: Date
  field :end_date, type: Date

  belongs_to :unit

  embedded_in :group

  embeds_one :webinar
  accepts_nested_attributes_for :webinar

  before_create :set_webinar

  def set_webinar
    Webinar.new start: start_date + unit.estimate.video + unit.estimate.test + unit.estimate.summary + unit.estimate.case + 12.hours
  end
end