`import DS from "ember-data";`

UserAnswer = DS.Model.extend
  quizProgressId: DS.attr 'string'
  questionId: DS.attr 'string'
  isCorrect: DS.attr 'boolean'

  question: DS.belongsTo 'question'
  answers:  DS.hasMany 'answer'


`export default UserAnswer;`
