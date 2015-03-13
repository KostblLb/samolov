class Homework::Subtask::ProfileSerializer < ActiveModel::Serializer
  attributes :id, :sex, :age, :appearance, :other_physical, :education_level, :specialization, :additional_training,
             :languages, :work_experience, :additional_requirements, :money, :image, :security, :physical_ease,
             :psychological_ease, :self_cultivation, :additional_requirements_company
end