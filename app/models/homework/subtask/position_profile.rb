module Homework
  module Subtask
    class PositionProfile < Base

      embeds_one :profile_compulsory, class_name: 'Homework::Subtask::Profile'
      embeds_one :profile_desirable, class_name: 'Homework::Subtask::Profile'

      accepts_nested_attributes_for :profile_compulsory, :profile_desirable

      before_create :build_profile_compulsory, :build_profile_desirable
    end
  end
end