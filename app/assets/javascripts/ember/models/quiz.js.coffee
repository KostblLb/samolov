# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.Quiz = DS.Model.extend
  text: DS.attr 'string'
  myProgressId: DS.attr 'string'

  questions: DS.hasMany 'questions'
