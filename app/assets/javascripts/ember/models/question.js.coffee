# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.Question = DS.Model.extend
  text: DS.attr 'string'

  answers: DS.hasMany 'answer'
