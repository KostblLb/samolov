# For more information see: http://emberjs.com/guides/routing/

Samolov.QuizProgressRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'quiz_progress', params.quiz_progress_id
  afterModel: (progress, transition) ->
    if progress.get 'isQuiz'
      $('.quiz_tab').addClass('active')
    else
      $('.case_tab').addClass('active')
    currentQuestion = progress.get 'currentQuestionId'
    if currentQuestion?
      @transitionTo 'question', currentQuestion
    else
     progress.get('quiz').content.reload()
     @_super
  deactivate: ->
    if @.modelFor('quiz_progress').get('isQuiz')
      $('.quiz_tab').removeClass('active')
    else
      $('.case_tab').removeClass('active')

