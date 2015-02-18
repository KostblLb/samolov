# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.Order = DS.Model.extend
  course: DS.belongsTo 'course'
