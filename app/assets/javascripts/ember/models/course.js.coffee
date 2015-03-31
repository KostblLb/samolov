# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.Course = DS.Model.extend

  name:             DS.attr 'string'
  cost:             DS.attr 'number'
  description:      DS.attr 'string'
  status:           DS.attr 'string'

  myGroup:          DS.belongsTo 'group', async: true
  myProgress:       DS.belongsTo 'course_progress'

  parts:            DS.hasMany 'part', async: true

  needBuy: (->
    @get('status') == 'new'
  ).property('status')
