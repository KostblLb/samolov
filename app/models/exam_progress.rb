class ExamProgress
  include Mongoid::Document

  belongs_to :unit_progress
  belongs_to :exam
end