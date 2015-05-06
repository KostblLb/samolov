class Webinar
  include Mongoid::Document
  field :link
  field :video
  field :start, type: DateTime, default: -> { DateTime.now }

  embedded_in :unit_schedule

end
