require 'rails_helper'

RSpec.describe Order, :type => :model do
  describe '#cost' do
    subject{order.cost}

    context 'order has cost' do
      let(:order){create :order, cost: 20}
      it{is_expected.to eq(20)}
    end

    context 'order has not cost' do
      let(:order){create :order, cost: nil}
      it{is_expected.to eq(order.course.cost)}
    end
  end

  describe 'paid' do
    let(:order){create :order}
    subject{order.paid}

    it 'sets state as paid' do
      expect{subject}.to change{order.reload.state}.to('paid')
    end

    it 'sets cost as cost of course' do
      expect{subject}.to change{order.reload.send(:read_attribute, :cost)}.from(nil).to(order.course.cost)
    end
  end
end
