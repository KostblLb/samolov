# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.Unit = DS.Model.extend
  name: DS.attr 'string'
  summary: DS.attr 'string'
  videoLink: DS.attr 'string'

  part: DS.belongsTo 'part', async: true

