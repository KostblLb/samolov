require 'rails_helper'

RSpec.shared_examples 'authorized controller' do
  context 'sign in as allowed user' do
    before(:each) {sign_in allowed_user}
    it {expect{subject}.to_not raise_error}
  end

  context 'sign in as disallowed user' do
    before(:each) {sign_in disallowed_user}
    it {expect{subject}.to raise_error(CanCan::AccessDenied)}
  end
end