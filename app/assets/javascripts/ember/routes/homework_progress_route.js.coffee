Samolov.HomeworkProgressRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'homework_progress', params.homework_progress_id

  setupController: (controller, model)->
    controller.set 'model', model