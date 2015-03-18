class Quiz
  include Mongoid::Document
  include Mongoid::Paperclip

  field :name

  belongs_to :quiz_socket, class_name: 'Unit', inverse_of: :quiz
  belongs_to :case_socket, class_name: 'Unit', inverse_of: :case
  has_many :questions, dependent: :destroy
  has_many :quiz_progresses

  has_mongoid_attached_file :preview_image

  validates_attachment_content_type :preview_image, :content_type => /\Aimage\/.*\Z/
  validate :only_one_socket_present

  accepts_nested_attributes_for :questions

  def unit
    quiz_socket || case_socket
  end

  protected
  def only_one_socket_present
    errors[:case_socket] << 'only one socket can be presented' if quiz_socket.present? && case_socket.present?
  end
end