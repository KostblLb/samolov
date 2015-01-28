# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.Part = DS.Model.extend
  name: DS.attr 'string'

  course: DS.belongsTo 'course', acync: true
