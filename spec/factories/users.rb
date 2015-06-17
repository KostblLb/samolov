include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com"}
    password 'passward'
    avatar { fixture_file_upload(Rails.root.join('spec/fixtures/noavatar.png'), 'image/png') }
  end
end

