class Unit
  include Mongoid::Document

  field :name
  field :video_link
  field :summary

  embeds_one :webinar

  belongs_to :part
  
  has_one :quiz, class_name: 'Quiz', inverse_of: :quiz_socket, dependent: :destroy
  has_one :case, class_name: 'Quiz', inverse_of: :case_socket, dependent: :destroy

  accepts_nested_attributes_for :webinar

  validates_presence_of :name, :summary
end
