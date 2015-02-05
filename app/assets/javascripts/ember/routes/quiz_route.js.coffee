# For more information see: http://emberjs.com/guides/routing/

Samolov.QuizRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'quiz', params.quiz_id