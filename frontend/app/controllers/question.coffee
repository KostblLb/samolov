`import Ember from "ember";`

  # for more details see: http://emberjs.com/guides/controllers/

QuestionController = Ember.ObjectController.extend

  canAnswer: ( ->
    @get('userAnswer.answers').get('length') == @get('model').get('rightAnswersCount')
  ).property('userAnswer.answers')

  hasAnswer: (->
    !@model.get('myAnswer.isNew')
  ).property('model.myAnswer')

  afterAnswer: (userAnswer)->
      @store.find('quiz_progress', userAnswer.get('quizProgressId')).then (progress) =>
        progress.reload().then =>
          @set 'userAnswers', []
          @transitionToRoute('quiz_progress', userAnswer.get('quizProgressId'))
  actions:
    answer: ->
      if @get('userAnswer.isNew')
        @get('userAnswer').save().then (userAnswer) =>
          @afterAnswer(userAnswer)
      else
        @afterAnswer(userAnswer)

 `export default QuestionController;`
