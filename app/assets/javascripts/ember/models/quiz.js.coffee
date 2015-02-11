# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.Quiz = DS.Model.extend
  text: DS.attr 'string'

  questions: DS.hasMany 'questions'
  myProgress: DS.belongsTo 'quiz_progress'


