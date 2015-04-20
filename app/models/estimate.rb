class Estimate
  include Mongoid::Document

  field :video, type: Integer, default: 1
  field :test, type: Integer, default: 1
  field :summary, type: Integer, default: 1
  field :case, type: Integer, default: 1
  field :webinar, type: Integer, default: 1
  field :homework, type: Integer, default: 2

  embedded_in :unit

  validates :video, :test, :summary, :homework, estimate: true


  def duration
    video + test + summary + self.case + webinar + homework
  end

end
