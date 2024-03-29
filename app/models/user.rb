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
  field :birthday, type: Date
  field :city
  field :country
  field :phone
  field :skype
  field :company_name
  field :job_title

  # social
  field :vk_link
  field :fb_link
  field :gplus_link
  field :ln_link
  field :tw_link

  has_and_belongs_to_many :conversations

  has_many :orders, dependent: :destroy

  has_many :course_progresses
  has_many :course_part_progresses
  has_many :unit_progresses
  has_many :quiz_progresses
  has_many :user_answers
  has_many :students_homeworks, class_name: 'Homework::Progress', inverse_of: :teacher
  has_many :my_homeworks, class_name: 'Homework::Progress', inverse_of: :student

  has_many :trained_groups, class_name: 'Group', inverse_of: :teacher
  has_and_belongs_to_many :groups

  has_one :subscribtion


  has_mongoid_attached_file :avatar,
                            default_url: '/default_avatar.jpg',
                            styles: {default: '100x100#'},
                            convert_options: { :all => '-background white -flatten +matte' }
  validates_attachment_content_type :avatar, :content_type => /\Aimage/

  before_save :set_avatar_extension, :set_subscribtion
  before_create :new_subscribtion

  def name
    "#{first_name} #{last_name}"
  end

  def has_course?(course)
    course_progresses.where(course: course).exists?
  end

  def course_progress_by(course)
    course_progresses.where(course: course).first
  end

  def has_part?(part)
    course_part_progresses.where(part: part).exists?
  end

  def course_part_progress_by(part)
    course_part_progresses.where(part: part).first
  end

  def unit_progress_by(unit)
    unit_progresses.where(unit: unit).first
  end

  def has_unit?(unit)
    unit_progresses.where(unit: unit).exists?
  end

  def has_quiz?(quiz)
    quiz_progresses.where(quiz: quiz).exists?
  end

  def teacher?
    trained_groups.any?
  end
  alias :is_teacher :teacher?

  def unreads_messages_count
    msg_count = 0
    conversations.each do |conv|
      conv.messages.each do |msg|
        msg_count += msg.receipts.where(recipient_id: id, is_read: false).count
      end
    end
    msg_count
  end

  def friends
    friend_ids = []
    trained_groups.each do |group|
      friend_ids += group.student_ids
    end
    groups.each do |group|
      friend_ids += group.student_ids
      friend_ids << group.teacher_id
    end
    User.where(:id.in => friend_ids).to_a
  end


  private
  def new_subscribtion
    self.create_subscribtion
  end

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

  def set_subscribtion
    if !subscribtion?
      self.create_subscribtion
    end
  end
end
