class User
  include Mongoid::Document
  include Mongoid::Paperclip
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time

  field :first_name
  field :last_name

  has_many :inbox,  class_name: 'Message', inverse_of: :recipient
  has_many :outbox, class_name: 'Message', inverse_of: :sender

  has_many :course_progresses

  has_mongoid_attached_file :avatar, default_url: '/default_avatar.jpg'
  validates_attachment_content_type :avatar, :content_type => /\Aimage/

  before_save :set_avatar_extension

  def name
    "#{first_name} #{last_name}"
  end

  def has_course?(course)
    course_progresses.where(course: course).exists?
  end

  private
  def set_avatar_extension
    if self.avatar_content_type.nil? || self.avatar_file_name != 'data'
      return true
    end
    begin
      name = SecureRandom.uuid
    end while !User.where(avatar_file_name: name).empty?
    extension = self.avatar_content_type.gsub('image/', '.')
    self.avatar.instance_write(:file_name, name+extension)
  end
end
