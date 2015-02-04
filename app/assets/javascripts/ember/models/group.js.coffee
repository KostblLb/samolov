# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.Group = DS.Model.extend
  name: DS.attr 'string'

  teacher: DS.belongsTo 'user', async: true
  course: DS.belongsTo 'course'

  students: DS.hasMany 'user'
  adverts: DS.hasMany 'advert'


  canICreateAdvert: (->
    @get('teacher').content.id == window.myId
  ).property('teacher')