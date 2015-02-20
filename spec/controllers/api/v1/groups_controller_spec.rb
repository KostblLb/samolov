require 'rails_helper'

RSpec.describe Api::V1::GroupsController, type: :controller do

  let(:group) {create :group}

  before :each do
    request.accept = 'application/json'
  end

  describe "GET index" do
    context 'signed in as students' do
      let(:user) {group.students.first}
      before(:each) {user.save && sign_in(user)}

      it 'assigns groups where I study as @groups' do
        get :index
        expect(assigns(:groups)).to eq([group])
      end
    end
    context 'signed in as students' do
      let(:user) {group.teacher}
      before(:each) {sign_in user}

      it 'assigns groups where I am teacher as @groups' do
        get :index, scope: 'as_teacher'
        expect(assigns(:groups)).to eq([group])
      end
    end
  end

  describe "GET show" do
    let(:user) {group.students.first}
    before(:each) {user.save && sign_in(user)}
    it "assigns the requested group as @group" do
      get :show, {:id => group.to_param}
      expect(assigns(:group)).to eq(group)
    end
  end

  describe 'PUT update' do
    let(:scale) {create :scale}
    let(:attributes) {{scale_id: scale.id}}
    before(:each) {sign_in user}

    subject{put :update, id: group.to_param, group: attributes}

    context 'signed in as teacher' do
      let(:user) {group.teacher}
      it 'updates scale for group' do
        expect{subject}.to change{group.reload.scale}.to(scale)
      end
    end

    context 'signed in as student' do
      let(:user) {group.students.first}
      it {expect{subject}.to raise_error(CanCan::AccessDenied)}
    end
  end
end
