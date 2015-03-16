module Homework
  module Subtask
    class PositionProfile < Base

      embeds_one :profile_compulsory, class_name: 'Homework::Subtask::Profile', autobuild: true
      embeds_one :profile_desirable, class_name: 'Homework::Subtask::Profile', autobuild: true

      accepts_nested_attributes_for :profile_compulsory, :profile_desirable

      # after_initialize do |position_profile|
      #   position_profile.profile_compulsory = Homework::Subtask::Profile.create
      #   position_profile.profile_desirable = Homework::Subtask::Profile.create
      # end
    end
  end
end