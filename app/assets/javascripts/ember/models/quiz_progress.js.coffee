# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.QuizProgress = DS.Model.extend Samolov.ProgressMixin,
  currentQuestionId: DS.attr 'string'
  correctAnswersCount: DS.attr 'number'
  points: DS.attr 'number'

  quiz: DS.belongsTo 'quiz', async: true
