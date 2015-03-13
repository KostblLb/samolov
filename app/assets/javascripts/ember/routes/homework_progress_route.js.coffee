Samolov.HomeworkProgressRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'homework_progress', params.homework_progress_id

  afterModel: (model, params) ->
    uId = model.get('unitId')
    if model.get('isAvailable')
      @transitionTo('homework_progress', model.get('id'))
    else
      @transitionTo('unit.index', uId, {queryParams: {scope: 'homework'}})