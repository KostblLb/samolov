`import Ember from 'ember'`

QuizProgressbarComponent = Ember.Component.extend
  number: null
  count: null
  quizProgress: null

  currentProgress: (->
    (@.get('quizProgress.quiz.myProgress.currentQuestionNumber') - 1) / @get('count') * 100
  ).property('number', 'quizProgress.quiz.myProgress.currentQuestionNumber')

  setProgress:(->
    @$('.bar').css('width', "#{@get('currentProgress')}%")
    @$('.number').css('width', "#{@get('currentProgress')}%")
  ).observes('currentProgress')

  didInsertElement: ->
    @$('.bar').css('width', "#{@get('currentProgress')}%")
    @$('.number').css('width', "#{@get('currentProgress')}%")

`export default QuizProgressbarComponent`
