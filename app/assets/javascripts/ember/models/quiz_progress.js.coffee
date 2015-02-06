# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.QuizProgress = DS.Model.extend
  currentQuestionId: DS.attr 'string'
  correctAnswersCount: DS.attr 'integer'
  points: DS.attr 'integer'

  quiz: DS.belongsTo 'quiz', async: true