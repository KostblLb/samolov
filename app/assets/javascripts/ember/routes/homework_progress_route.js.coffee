Samolov.HomeworkProgressRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'homework_progress', params.homework_progress_id

  afterModel: (model, params) ->
    model.reload()
    uId = model.get('unitId')
    if model.get('isAvailable')
      @transitionTo('homework_progress', model.get('id'))
    else
      @transitionTo('unit.index', uId, {queryParams: {scope: 'is_not_available'}})