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
 
`export default Profile;`
