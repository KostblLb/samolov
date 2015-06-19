`import DS from "ember-data";`

# for more details see: http://emberjs.com/guides/models/defining-models/

Group = DS.Model.extend
  name:               DS.attr 'string'
  educationBeginning: DS.attr 'string'

  teacher: DS.belongsTo 'user', async: true
  myCourse:  DS.belongsTo 'course', inverse: 'myGroup'
  course:  DS.belongsTo 'course', inverse: 'groups'
  scale:   DS.belongsTo 'scale'

  students:         DS.hasMany 'user', async: true
  adverts:          DS.hasMany 'advert'
  courseProgresses: DS.hasMany 'course_progress', async: true
  unitProgresses:   DS.hasMany 'unit_progress', async: true
  format: 'DD.MM.YYYY'


  canICreateAdvert: (->
    return false unless @get('teacher').content?
    @get('teacher').content.id == window.myId
  ).property('teacher')

  sortedCourseProgresses: (->
    @get('courseProgresses').sortBy('points').reverse()
  ).property('courseProgresses.@each.points')

  formattedEducationBeginnning: (->
    date = @.get 'educationBeginning'
    format = @.get 'format'
    moment(date).format format
  ).property('educationBeginning', 'format')

`export default Group;`
