require 'rails_helper'

RSpec.describe Api::V1::ConversationsController, :type => :controller do

  let(:sender) {create :user}

  before :each do
    request.accept = 'application/json'
    sign_in sender
  end

  describe "POST create" do
    let(:recipient) {create :user}
    context 'with valid params' do
      let(:valid_attributes) { {subject: 'New', user_ids:[sender.id, recipient.id], messages_attributes: [sender: sender, body: 'New message']} }
      subject{post :create, {conversation: valid_attributes}}
      it 'creates a new Conversation' do
        expect {
          subject
        }.to change{Conversation.count}.by(1)
      end
      it 'creates a new Message' do
        subject
        expect(assigns(:conversation).messages.count).to eq(1)
      end
      it 'add 2 users in conversation' do
        subject
        expect(assigns(:conversation).users.count).to eq(2)
      end
    end
  end

  describe "DELETE destroy" do
    let(:conversation) {create :conversation}
    before(:each) { conversation.save }
    context 'with valid id' do
      subject{delete :destroy, {id: conversation.id}}
      it 'destroy Conversation with current_id' do
        expect {
          subject
        }.to change(Conversation, :count).by(-1)
      end
    end
  end

  describe "PUT update" do
    let(:conversation) {create :conversation}
    let(:new_user) {create :user}
    before(:each) { conversation.save }
      subject{put :update, id: conversation.id, conversation: {subject: 'Subj', user_ids: [new_user.id] }}
      it 'change the subject of conversation' do
        subject
        expect(assigns(:conversation).subject).to eq('Subj')
      end
      it 'add new_user in conversation' do
        subject
        expect(assigns(:conversation).users.count).to eq(1)
      end
  end

  describe "GET show" do
    let(:conversation) {create :conversation}
    before(:each) { conversation.save }
    subject{get :show, id: conversation.id}
    it 'return current conversation' do
      subject
      expect(assigns(:conversation)).to eq(conversation)
    end
  end

  describe "GET view" do
    let(:conversation) {create :conversation}
    before(:each) do
      conversation.save
      sign_in conversation.users.last
    end
    subject{get :view, id: conversation.id}
    it 'set viewed for all messages' do
      subject
      expect(assigns(:conversation).messages.count).to eq(2)
      expect(assigns(:conversation).messages.first.unread?(conversation.users.last)).to be_truthy
      expect(assigns(:conversation).messages.last.unread?(conversation.users.last)).to be_truthy
    end

    it 'not set viewed for non-authorization user' do
      subject
      expect(assigns(:conversation).messages.count).to eq(2)
      expect(assigns(:conversation).messages.first.unread?(conversation.users.offset(1).last)).to be_falsey
      expect(assigns(:conversation).messages.last.unread?(conversation.users.offset(1).last)).to be_falsey
    end
  end

end
