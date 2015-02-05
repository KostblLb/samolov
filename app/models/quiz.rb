class Quiz
  include Mongoid::Document

  field :name

  belongs_to :test_socket, class_name: 'Unit', inverse_of: :quiz
  belongs_to :case_socket, class_name: 'Unit', inverse_of: :case
  has_many :questions, dependent: :destroy
  has_many :quiz_progresses

  validate :only_one_socket_present

  protected
  def only_one_socket_present
    errors[:case_socket] << 'only one socket can be presented' if test_socket.present? && case_socket.present?
  end
end