FactoryGirl.define do
  factory :webinar do
    link "MyString"
    start "2015-01-01"
    self.end "2015-01-05"
  end

  factory :webinar2, class: Webinar do
    link "MyString"
    start "2015-01-30"
    self.end "2015-01-10"
  end

end
