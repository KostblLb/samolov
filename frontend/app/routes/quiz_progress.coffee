`import Ember from "ember";`

# For more information see: http://emberjs.com/guides/routing/

QuizProgressRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'quiz_progress', params.quiz_progress_id

  afterModel: (progress, transition) ->
    if progress.get('isQuiz')
      $('.case_tab').removeClass('active')
      $('.quiz_tab').addClass('active')
    else
      $('.quiz_tab').removeClass('active')
      $('.case_tab').addClass('active')
    currentQuestion = progress.get 'currentQuestionId'
    if currentQuestion?
      @transitionTo 'question', currentQuestion
    else
      progress.get('unitProgress').reload()
      progress.get('quiz').content.reload()
      @_super
  actions:
    willTransition: ->
      $('.quiz_tab').removeClass('active')
      $('.case_tab').removeClass('active')

`export default QuizProgressRoute;`
