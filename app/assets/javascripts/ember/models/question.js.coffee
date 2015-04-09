# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.Question = DS.Model.extend
  text:              DS.attr 'string'
  preview_image_url: DS.attr 'string'
  rightAnswersCount: DS.attr 'number'
  number:            DS.attr 'number', async: true

  answers:        DS.hasMany 'answer'
  correctAnswers: DS.hasMany 'answer'
  myAnswer:       DS.belongsTo 'user_answer'
  quiz:           DS.belongsTo 'quiz', async: true

  isSingleAnswer: ( ->
    @get('rightAnswersCount') == 1
  ).property('rightAnswersCount')

