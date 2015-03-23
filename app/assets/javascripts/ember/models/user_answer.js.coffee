# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.UserAnswer = DS.Model.extend
  quizProgressId: DS.attr 'string'
  questionId: DS.attr 'string'
  isCorrect: DS.attr 'boolean'

  question: DS.belongsTo 'question'
  answers:  DS.hasMany 'answer'
