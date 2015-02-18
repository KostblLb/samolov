require 'rails_helper'

RSpec.describe Api::V1::OrdersController, :type => :controller do

  let(:user) {create :user}

  before :each do
    request.accept = 'application/json'
    sign_in user
  end

  describe 'GET show' do
    let(:order) {create :order, user: user}
    it 'assigns the requested order as @order' do
      get :show, id: order.to_param
      expect(assigns(:order)).to eq(order)
    end
  end

  describe 'POST create' do
    let(:course) {create :course}
    subject{post :create, order: {course_id: course.id}}

    it 'creates new Order' do
      expect{subject}.to change{Order.count}.by(1)
    end

    it 'assigns new order with current_user' do
      expect{subject}.to change{user.reload.orders.count}.by(1)
    end

    it 'assigns new order with requested course' do
      subject
      expect(assigns(:order).course).to eq(course)
    end
  end

end
