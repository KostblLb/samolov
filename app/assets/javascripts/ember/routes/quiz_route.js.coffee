# For more information see: http://emberjs.com/guides/routing/

Samolov.QuizRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'quiz', params.quiz_id

  afterModel: (model) ->
    @transitionTo('quiz_progress', model.get('myProgress.id')) unless model.get('myProgress.currentQuestionId')?