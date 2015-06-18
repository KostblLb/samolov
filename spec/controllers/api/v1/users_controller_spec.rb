require 'rails_helper'

RSpec.describe Api::V1::UsersController, :type => :controller do

  let(:user) {create :user}

  before :each do
    request.accept = 'application/json'
    sign_in user
  end

  describe 'GET show' do
    before(:each) {get :show, id: user.id}
    it 'returns http success' do
      expect(response).to be_success
    end

    it 'assigns current_user as @user' do
      expect(assigns :user).to eq(user)
    end
  end

  describe 'GET update' do
    let(:attrs) {{first_name: 'name1'}}
    subject {put :update, id: user.id, user: attrs}

    it 'updates first_name of user' do
      expect{subject}.to change{user.reload.first_name}.to('name1')
    end

    context 'pass avatar as null' do
      let(:user){create :user}
      let(:attrs) {{avatar: nil}}

      it{expect{subject}.not_to change{user.avatar.url}}
    end
  end

end
