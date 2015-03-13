module Homework
  module Subtask
    class PositionProfile < Base

      embeds_one :profile_compulsory, class_name: 'Homework::Subtask::Profile'
      embeds_one :profile_desirable, class_name: 'Homework::Subtask::Profile'

      after_initialize do |position_profile|
        position_profile.profile_compulsory = Homework::Subtask::Profile.create
        position_profile.profile_desirable = Homework::Subtask::Profile.create
      end
    end
  end
end