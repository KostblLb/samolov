class Unit
  include Mongoid::Document
  include Mongoid::Paperclip

  field :name
  field :video_link
  field :summary
  field :position, type: Integer, default: 1
  field :is_exam, type: Mongoid::Boolean, default: false

  has_many :unit_progresses

  embeds_one :webinar
  embeds_one :estimate, autobuild: true

  belongs_to :part
  belongs_to :homework_meta, class_name: 'Homework::Meta::Progress'
  
  has_one :quiz, class_name: 'Quiz', inverse_of: :quiz_socket, dependent: :destroy
  has_one :case, class_name: 'Quiz', inverse_of: :case_socket, dependent: :destroy

  has_mongoid_attached_file :attachment
  do_not_validate_attachment_file_type :attachment

  accepts_nested_attributes_for :webinar, :estimate, :quiz, :case

  validates_presence_of :name

  default_scope -> {asc :position}

  def duration
    estimate.duration
  end

  def dup
    Unit.new(name: 'Copy of ' + name, video_link: video_link, summary: summary, is_exam: is_exam, webinar: webinar,
             attachment: attachment? ? (File.exists?(attachment.path) ? attachment : nil) : nil,
             quiz: quiz ? quiz.dup : nil, case: self.case ? self.case.dup : nil)
  end

  def dup!
    new_unit = dup
    new_unit.save!
    new_unit
  end
end