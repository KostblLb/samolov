# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.QuizProgress = DS.Model.extend Samolov.ProgressMixin,

  currentQuestionId:      DS.attr 'string'
  correctAnswersCount:    DS.attr 'number'
  currentQuestionNumber:  DS.attr 'number'
  points:                 DS.attr 'number'
  unitId:                 DS.attr 'string'
  isQuiz:                 DS.attr 'boolean'
  isCase:                 DS.attr 'boolean'

  userAnswers:            DS.hasMany 'userAnswer'

  quiz:                   DS.belongsTo 'quiz', inverse: 'quizProgresses', async: true
  quizProgressSocket:     DS.belongsTo 'unit_progress', async: true, inverse: 'quizProgress'
  caseProgressSocket:     DS.belongsTo 'unit_progress', async: true, inverse: 'caseProgress'

  unitProgress: (->
    if @get('isQuiz')
      @get('quizProgressSocket').content
    else
      @get('caseProgressSocket').content
  ).property('isQuiz')


