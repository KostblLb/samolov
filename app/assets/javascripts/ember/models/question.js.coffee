# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.Question = DS.Model.extend
  text: DS.attr 'string'
  rightAnswersCount: DS.attr 'number'

  answers: DS.hasMany 'answer'
  correctAnswers: DS.hasMany 'answer'
  myAnswer: DS.belongsTo 'user_answer'

  isSingleAnswer: ( ->
    @get('rightAnswersCount') == 1
  ).property('rightAnswersCount')

