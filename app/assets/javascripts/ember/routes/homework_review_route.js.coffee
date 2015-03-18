# For more information see: http://emberjs.com/guides/routing/

Samolov.HomeworkReviewRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'homework_progress', params.homework_progress_id