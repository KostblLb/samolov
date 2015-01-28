# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.Course = DS.Model.extend
  name: DS.attr 'string'
  description: DS.attr 'string'
  status: DS.attr 'string'

  needBuy: (->
    @get('status') == 'new'
  ).property('status')

  myGroup: DS.belongsTo 'group', async: true