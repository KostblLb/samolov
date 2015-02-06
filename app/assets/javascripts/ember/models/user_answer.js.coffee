# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.UserAnswer = DS.Model.extend
  quizProgressId: DS.attr 'string'
  isCorrect: DS.attr 'boolean'

  answer:   DS.belongsTo 'answer'
  question: DS.belongsTo 'question'
