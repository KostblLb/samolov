require 'rails_helper'

RSpec.describe Message, :type => :model do
  describe 'create receipts' do
    let(:conversation) {create :conversation}
    it 'create receipts' do
      expect(conversation.messages.first.receipts.count).to eq(2)
      expect(conversation.messages.first.receipts.first.is_read).to be_falsey
    end
  end

  describe '#unread?(user)' do
    subject {conversation.messages.first.unread?(conversation.users.last)}
    let(:conversation) {create :conversation}

    context 'when is_read falsey' do
      it { is_expected.to be_falsey}
    end

    context 'when is_read truthy' do
      before(:each) {conversation.messages.first.receipts.update_all(is_read: true)}
      it { is_expected.to be_truthy}
    end
  end

  describe '#viewed_by(user)' do
    let(:conversation) {create :conversation}

    context 'when valid user' do
      subject {conversation.messages.first.unread?(conversation.users.last)}
      before(:each) { conversation.messages.first.viewed_by(conversation.users.last) }
      it { is_expected.to be_truthy }
    end

    context 'when invalid user' do
      let(:invalid) {create :user}
      subject {conversation.messages.first.unread?(invalid)}
      before(:each) { conversation.messages.first.viewed_by(invalid) }
      it { is_expected.to be_falsey }
    end

  end
end
