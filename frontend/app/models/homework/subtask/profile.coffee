`import DS from "ember-data";`

Profile = DS.Model.extend
  sex:                              DS.attr 'string'
  age:                              DS.attr 'string'
  appearance:                       DS.attr 'string'
  otherPhysical:                    DS.attr 'string'
  educationLevel:                   DS.attr 'string'
  specialization:                   DS.attr 'string'
  additionalTraining:               DS.attr 'string'
  languages:                        DS.attr 'string'
  workExperience:                   DS.attr 'string'
  additionalRequirements:           DS.attr 'string'
  money:                            DS.attr 'string'
  image:                            DS.attr 'string'
  security:                         DS.attr 'string'
  physicalEase:                     DS.attr 'string'
  psychologicalEase:                DS.attr 'string'
  selfCultivation:                  DS.attr 'string'
  additionalRequirementsCompany:    DS.attr 'string'

  isFilled: (->
    fieldIsFilled('sex') && fieldIsFilled('age') && fieldIsFilled('appearance') && fieldIsFilled('otherPhysical') &&
      fieldIsFilled('educationLevel') && fieldIsFilled('specialization') && fieldIsFilled('additionalTraining') &&
      fieldIsFilled('languages') && fieldIsFilled('workExperience') && fieldIsFilled('additionalRequirements') &&
      fieldIsFilled('money') && fieldIsFilled('image') && fieldIsFilled('security') && fieldIsFilled('physicalEase') &&
      fieldIsFilled('psychologicalEase') && fieldIsFilled('selfCultivation') && fieldIsFilled('additionalRequirementsCompany')
  ).property('sex', 'age', 'appearance', 'otherPhysical', 'educationLevel', 'specialization', 'additionalTraining',
            'languages', 'workExperience', 'additionalRequirements', 'money', 'image', 'security' , 'physicalEase' ,
            'psychologicalEase' , 'selfCultivation' , 'additionalRequirementsCompany')

  fieldIsFilled: (field)->
    @get(field)? && @get(field) != ''

`export default Profile;`
