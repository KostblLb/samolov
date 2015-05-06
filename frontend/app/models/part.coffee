`import DS from "ember-data";`

Part = DS.Model.extend
  name: DS.attr 'string'

  course:     DS.belongsTo 'course', async: true
  myProgress: DS.belongsTo 'course_part_progress'

  coursePartProgresses: DS.hasMany 'course_part_progress'
  units:      DS.hasMany 'unit'


`export default Part;`
