require 'rails_helper'

RSpec.describe Api::V1::MessagesController, :type => :controller do

  let(:user) {create :user}
  let(:teacher) {create :user}

  before :each do
    request.accept = 'application/json'
    sign_in user
  end

  describe 'GET index' do

  end
end
