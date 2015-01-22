require 'rails_helper'

RSpec.describe Api::V1::MessagesController, :type => :controller do

  let(:user) {create :user}

  before :each do
    request.accept = 'application/json'
    sign_in user
  end

  describe 'GET index' do
    let(:inbox_message)  {create :message, recipient: user}
    let(:outbox_message) {create :message, sender: user}

    before(:each) {inbox_message; outbox_message }

    context 'scope is outbox' do
      before(:each) {get :index, scope: 'outbox'}
      subject{assigns :messages}

      it {is_expected.to include(outbox_message)}
      it {is_expected.not_to include(inbox_message)}
    end

    context 'scope is inbox' do
      before(:each) {get :index, scope: 'inbox'}
      subject{assigns :messages}

      it {is_expected.to include(inbox_message)}
      it {is_expected.not_to include(outbox_message)}
    end

    context 'scope is wrong all nil' do
      subject {get :index, scope: 'fake'}
      it {expect{subject}.to raise_error(CanCan::AccessDenied)}
    end
  end

  describe 'GET show' do
    let(:message) {create :message, sender: user}
    it 'assigns the requested message as @message' do
      get :show, id: message.to_param
      expect(assigns(:message)).to eq(message)
    end
  end

  describe 'POST create' do
    let(:recipient) {create :user}
    context 'with valid params' do
      let(:valid_attributes) { {recipient_id: recipient.id, body: 'text'} }
      subject{post :create, {message: valid_attributes}}
      it 'creates a new Message' do
        expect {
          subject
        }.to change(Message, :count).by(1)
      end

      it "assigns a newly created message as @message" do
        subject
        expect(assigns(:message)).to be_a(Message)
        expect(assigns(:message)).to be_persisted
      end
      it 'assigns sender as current_user' do
        subject
        expect(assigns(:message).sender).to eq(user)
      end
    end

    context 'try pass sender' do
      let(:sender) {create :user}
      before(:each) {post :create, message: {body: 'text', recipient_id: recipient.id, sender_id: sender.id}}
      subject{assigns(:message).sender}

      it {is_expected.not_to eq(sender)}
      it {is_expected.to eq(user)}
    end

  end

end
