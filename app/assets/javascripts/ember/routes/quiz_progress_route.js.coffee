# For more information see: http://emberjs.com/guides/routing/

Samolov.QuizProgressRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'quiz_progress', params.quiz_progress_id
  afterModel: (progress, transition) ->
    currentQuestion = progress.get 'currentQuestionId'
    if currentQuestion?
      @transitionTo 'question', currentQuestion
