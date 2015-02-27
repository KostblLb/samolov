# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.UserAnswer = DS.Model.extend
  quizProgressId: DS.attr 'string'
  isCorrect: DS.attr 'boolean'
  answerIds: DS.attr()

  #answers:  DS.hasMany 'answer', async: true
  question: DS.belongsTo 'question'
