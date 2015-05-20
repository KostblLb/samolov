`import DS from "ember-data";`

Part = DS.Model.extend
  name: DS.attr 'string'

  course:     DS.belongsTo 'course', async: true
  myProgress: DS.belongsTo 'course_part_progress'

  coursePartProgresses: DS.hasMany 'course_part_progress'
  units:      DS.hasMany 'unit'

  format: 'DD MMMM'

  convertDate: (field) ->
    date = @.get field
    format = @.get 'format'
    moment(date).format format

  partStart: (->
    @get('myProgress.partBeginning')
  ).property('myProgress.partBeginning')

  partEnd: (->
    @get('myProgress.deadline')
  ).property('myProgress.deadline')

  formattedPartStart: (->
    @convertDate 'partStart'
  ).property('partStart', 'format')

  formattedPartEnd: (->
    @convertDate 'partEnd'
  ).property('partEnd', 'format')

  isCurrent: (->
    (moment(@get('partStart')) < moment() && moment(@get('partEnd')) > moment()) ||
      ((moment(@get('course.courseStart'))) > moment() && @ == @get('course.parts.firstObject'))
  ).property('partStart', 'partEnd', 'course.courseStart', 'course.parts.firstObject')



`export default Part;`
