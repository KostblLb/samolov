FactoryGirl.define do
  factory :homework_subtask_position_profile, class: Homework::Subtask::PositionProfile do


    profile_compulsory { build(:homework_subtask_profile) }

    association :meta, factory: :homework_meta_position_profile

  end
end
