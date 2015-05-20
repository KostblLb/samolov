`import DS from "ember-data";`

# for more details see: http://emberjs.com/guides/models/defining-models/

Course = DS.Model.extend

  name:             DS.attr 'string'
  cost:             DS.attr 'number'
  description:      DS.attr 'string'
  status:           DS.attr 'string'

  myGroup:          DS.belongsTo 'group', async: true
  myProgress:       DS.belongsTo 'course_progress'

  groups:           DS.hasMany 'group', async: true

  parts:            DS.hasMany 'part', async: true

  format: 'DD MMMM'

  convertDate: (field) ->
    date = @.get field
    format = @.get 'format'
    moment(date).format format

  needBuy: (->
    @get('status') == 'new'
  ).property('status')

  courseStart: (->
    @get('myProgress.courseBeginning')
  ).property('myProgress.courseBeginning')

  courseEnd: (->
    @get('myProgress.deadline')
  ).property('myProgress.deadline')

  formattedCourseStart: (->
    @convertDate 'courseStart'
  ).property('courseStart', 'format')

  formattedCourseEnd: (->
    @convertDate 'courseEnd'
  ).property('courseEnd', 'format')


`export default Course;`
