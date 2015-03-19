class Unit
  include Mongoid::Document
  include Mongoid::Paperclip

  field :name
  field :video_link
  field :summary
  field :position
  field :is_exam, type: Mongoid::Boolean, default: false

  has_many :unit_progresses

  embeds_one :webinar

  belongs_to :part
  belongs_to :homework_meta, class_name: 'Homework::Meta::Progress'
  
  has_one :quiz, class_name: 'Quiz', inverse_of: :quiz_socket, dependent: :destroy
  has_one :case, class_name: 'Quiz', inverse_of: :case_socket, dependent: :destroy

  has_mongoid_attached_file :attachment
  do_not_validate_attachment_file_type :attachment

#  def quiz_socket_id
#    self.quiz :q_id
#  end
#  def quiz_socket_id=(q_id)
#    self.quiz = Quiz.find(q_id)
#  end
#  def case_socket_id
#    self.case :c_id
#  end
#  def case_socket_id=(c_id)
#    self.case = Quiz.find(c_id)
#  end

  accepts_nested_attributes_for :webinar

  validates_presence_of :name, :part
end
