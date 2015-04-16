class EstimateValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    if object.unit.is_exam && value != 0
      object.errors[attribute] << "#{attribute} can not be greater than zero when Unit is exam"
    end
  end
end