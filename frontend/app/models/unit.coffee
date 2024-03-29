`import DS from "ember-data";`

Unit = DS.Model.extend
  name:           DS.attr 'string'
  summary:        DS.attr 'string'
  videoLink:      DS.attr 'string'
  isExam:         DS.attr 'boolean'
  position:       DS.attr 'number'
  attachmentUrl:  DS.attr 'string'

  myProgress: DS.belongsTo 'unit_progress'
  part:       DS.belongsTo 'part', async: true

  quiz:       DS.belongsTo 'quiz', async: true
  case:       DS.belongsTo 'quiz', async: true

  unitProgresses: DS.hasMany 'unit_progresses', async: true, inverse: 'unit'

  sortedProgresses: (->
    @get('unitProgresses').sortBy('points').reverse()
  ).property('unitProgresses.@each.points')

  nextUnit: (->
    @get('part.units').findBy('position', @get('position') + 1)
  ).property('part')

  prevUnit: (->
    @get('part.units').findBy('position', @get('position') - 1)
  ).property('part')

  noNextOrPrev: (->
    !@get('nextUnit')? || !@get('prevUnit')?
  ).property('nextUnit', 'prevUnit')

`export default Unit;`
