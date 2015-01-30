class Webinar
  include Mongoid::Document
  field :link
  field :start, type: DateTime, default: -> { DateTime.now }
  field :end,   type: DateTime, default: -> { DateTime.now }

  embedded_in :unit
end
