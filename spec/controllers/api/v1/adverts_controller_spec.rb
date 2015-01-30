require 'rails_helper'

RSpec.describe Api::V1::AdvertsController do

  let(:group) {create :group, adverts: [(build :advert)]}
  let(:user) {group.teacher}

  before :each do
    request.accept = 'application/json'
    sign_in user
  end

  describe 'GET index' do
    subject{get :index, group_id: group.id}

    it_behaves_like 'authorized controller' do
      let(:allowed_user) {group.students.first}
      let(:disallowed_user) {create :user}
    end

    it 'assigns all adverts of the group as @adverts' do
      subject
      expect(assigns :adverts).to eq(group.adverts)
    end
  end

  describe 'GET show' do
    subject{get :show, group_id: group.id, id: group.adverts.first.to_param}
    it_behaves_like 'authorized controller' do
      let(:allowed_user) {group.students.first}
      let(:disallowed_user) {create :user}
    end

    it 'assigns requested advert of the group as @advert' do
      subject
      expect(assigns :advert).to eq(group.adverts.first)
    end
  end

  describe 'POST create' do
    let(:attributes) {{title: 'new advert', text: 'new text'}}
    subject{post :create, group_id: group.to_param, advert: attributes}
    it_behaves_like 'authorized controller' do
      let(:allowed_user) {group.teacher}
      let(:disallowed_user) {group.students.first}
    end

    it 'creates a new advert in the group' do
      expect{subject}.to change{group.reload.adverts.count}.by(1)
    end
  end

  describe 'DELETE destroy' do
    subject{delete :destroy, group_id: group.to_param, id: group.adverts.first.to_param}
    it_behaves_like 'authorized controller' do
      let(:allowed_user) {group.teacher}
      let(:disallowed_user) {group.students.first}
    end

    it 'deletes advert in the group' do
      expect{subject}.to change{group.reload.adverts.count}.by(-1)
    end
  end

end