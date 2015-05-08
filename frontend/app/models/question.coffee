`import DS from "ember-data";`

Question = DS.Model.extend
  text:              DS.attr 'string'
  preview_image_url: DS.attr 'string'
  rightAnswersCount: DS.attr 'number'
  number:            DS.attr 'number', async: true

  answers:        DS.hasMany 'answer'
  correctAnswers: DS.hasMany 'answer'
  myAnswer:       DS.belongsTo 'user_answer'
  quiz:           DS.belongsTo 'quiz', async: true

  showCorrectAnswers: DS.attr()

  isSingleAnswer: ( ->
    @get('rightAnswersCount') == 1
  ).property('rightAnswersCount')

  inMyAnswers: (->
    @set('showCorrectAnswers', @get('correctAnswers'))
    if @get('myAnswer')? && @get('myAnswer.answers').length > 0
      @get('myAnswer.answers').forEach (answer, index, array)=>
        @get('showCorrectAnswers').removeObject(answer)
    if @get('showCorrectAnswers')? then @get('showCorrectAnswers').length > 0 else false
  ).property('myAnswer')

`export default Question;`
