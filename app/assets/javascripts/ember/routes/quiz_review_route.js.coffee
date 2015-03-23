# For more information see: http://emberjs.com/guides/routing/

Samolov.QuizReviewRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'quiz_progress', params.quiz_progress_id