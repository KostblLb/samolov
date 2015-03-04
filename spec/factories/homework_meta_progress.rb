FactoryGirl.define do
  factory :homework_meta_progress, class: Homework::Meta::Progress do
    meta_bases{[build(:homework_meta_text), build(:homework_meta_table)]}
  end
end