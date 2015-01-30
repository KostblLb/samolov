# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.Group = DS.Model.extend
  teacher: DS.belongsTo 'user', async: true
  students: DS.hasMany 'user', async: true
  adverts: DS.hasMany 'advert'

  canICreateAdvert: (->
    @get('teacher') == @currentUser
  ).property('teacher')