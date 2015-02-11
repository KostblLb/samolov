# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.Part = DS.Model.extend
  name: DS.attr 'string'

  course:     DS.belongsTo 'course', async: true
  myProgress: DS.belongsTo 'course_part_progress'
  units:      DS.hasMany 'unit',     async: true
