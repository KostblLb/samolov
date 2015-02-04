class Unit
  include Mongoid::Document

  field :name
  field :video_link
  field :summary

  embeds_one :webinar

  belongs_to :part

  accepts_nested_attributes_for :webinar

  belongs_to :first_test, class_name: 'Exam', inverse_of: :exam, dependent: :destroy
  belongs_to :second_test, class_name: 'Exam', inverse_of: :exam, dependent: :destroy

  validates_presence_of :name, :summary
end
