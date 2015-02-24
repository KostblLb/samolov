FactoryGirl.define do
  factory :progress, :class => Homework::Progress do
    homework_metas{build_list(:homework_meta, 2)}
  end
end