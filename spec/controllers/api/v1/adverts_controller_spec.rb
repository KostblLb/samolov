require 'rails_helper'

RSpec.describe Api::V1::AdvertsController do

  before :each do
    request.accept = 'application/json'
  end

  describe 'GET index' do
    let(:group) {create :group, adverts: [(build :advert)]}

    it 'assigns all adverts of the group as @adverts' do
      get :index, group_id: group.id
      expect(assigns :adverts).to eq(group.adverts)
    end
  end
end