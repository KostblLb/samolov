class Estimate
  include Mongoid::Document
  field :video, type: Integer, default: 1
  field :test, type: Integer, default: 1
  field :summary, type: Integer, default: 1
  field :case, type: Integer, default: 1
  field :homework, type: Integer, default: 1

  embedded_in :unit

  def duration
    video + test + summary + self.case + 1 + homework
  end
end
