class Order
  include Mongoid::Document
  include Mongoid::Timestamps

  field :cost, type: Float

  belongs_to :user
  belongs_to :course

  default_scope -> {desc(:updated_at)}

  state_machine initial: :new do
    state :new
    state :paying
    state :paid

    event :paid do
      transition [:new, :paying] => :paid
    end

    before_transition on: :paid do |order|
      order.cost = order.course.cost
    end
  end

  def cost
    super || course.cost
  end
end
