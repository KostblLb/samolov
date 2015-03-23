# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.Quiz = DS.Model.extend
  text: DS.attr 'string'
  questions: DS.hasMany 'questions'
  quizProgresses: DS.hasMany 'quiz_progress', inverse: 'quiz'
  myProgress: DS.belongsTo 'quiz_progress', inverse: null
  isQuiz: DS.attr 'boolean'
  isCase: DS.attr 'boolean'


