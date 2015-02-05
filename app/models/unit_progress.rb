class UnitProgress
  include Mongoid::Document

  belongs_to :course_part_progress
  belongs_to :exam_progress
  belongs_to :unit

  after_create :create_exam_progress_for_unit_progress
end