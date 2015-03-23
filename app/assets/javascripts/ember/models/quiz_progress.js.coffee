# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.QuizProgress = DS.Model.extend Samolov.ProgressMixin,
  currentQuestionId: DS.attr 'string'
  correctAnswersCount: DS.attr 'number'
  userAnswers: DS.hasMany 'userAnswer'
  points: DS.attr 'number'

  quiz: DS.belongsTo 'quiz', inverse: 'quizProgresses', async: true

  unitId: DS.attr 'string'
  isQuiz: DS.attr 'boolean'
  isCase: DS.attr 'boolean'
