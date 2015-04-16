class UnitSchedule
  include Mongoid::Document

  field :start_date, type: Date
  field :end_date, type: Date

  belongs_to :unit

  embedded_in :group
end
