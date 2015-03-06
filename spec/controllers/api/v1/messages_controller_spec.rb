require 'rails_helper'

RSpec.describe Api::V1::MessagesController, :type => :controller do

  let(:user) {create :user}

  before :each do
    request.accept = 'application/json'
    sign_in user
  end

  describe 'POST create' do
    let(:conversation) {create :conversation}
    before(:each) { conversation.save }
    context 'with valid params' do
      let(:valid_attributes) { {sender: conversation.users.first.id, body: 'text'} }
      subject{post :create, conversation_id: conversation.id, message: valid_attributes}
      it 'creates a new Message' do
        subject
        expect(assigns(:message)).to be_persisted
      end

      it "assigns a newly created message as @message" do
        subject
        expect(assigns(:message)).to be_a(Message)
      end
    end
  end

  describe "DELETE destroy" do
    let(:conversation) {create :conversation}
    before(:each) { conversation.save }
    subject{delete :destroy, id: conversation.messages.first.id, conversation_id: conversation.id}
    it 'destroy Message with current_id' do
      subject
      expect(conversation.reload.messages.count).to eq(1)
    end
  end

  describe "GET show" do
    let(:conversation) {create :conversation}
    before(:each) { conversation.save }
    subject{get :show, id: conversation.messages.first.id, conversation_id: conversation.id}
    it 'return current conversation' do
      subject
      expect(assigns(:message)).to eq(conversation.messages.first)
    end
  end

end
