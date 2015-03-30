class Estimate
  include Mongoid::Document

  field :video, type: Integer, default: 1
  field :test, type: Integer, default: 1
  field :summary, type: Integer, default: 1
  field :case, type: Integer, default: 1
  field :webinar, type: Integer, default: 1
  field :homework, type: Integer, default: 1

  embedded_in :unit

  validates :video, :test, :summary, :homework, estimate: true

  after_create do |estimate|
    if estimate.unit.is_exam
      estimate.video = estimate.test = estimate.summary = estimate.homework = 0
    end
  end

  def duration
    video + test + summary + self.case + webinar + homework
  end

end
