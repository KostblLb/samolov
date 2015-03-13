module Homework
  module Subtask
    class Profile
      include Mongoid::Document

      field :sex
      field :age
      field :appearance
      field :other_physical
      field :education_level
      field :specialization
      field :additional_training
      field :languages
      field :work_experience
      field :additional_requirements
      field :money
      field :image
      field :security
      field :physical_ease
      field :psychological_ease
      field :self_cultivation
      field :additional_requirements_company

    end
  end
end