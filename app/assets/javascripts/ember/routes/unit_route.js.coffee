# For more information see: http://emberjs.com/guides/routing/

Samolov.UnitRoute = Ember.Route.extend
  model: (params)->
    @store.find('unit', params.unit_id)

  afterModel: (model, params) ->
    uId   = model.get('id')
    scope = model.get('myProgress.state')
    hId   = model.get('myProgress.homeworkProgress.id')
    qId   = model.get('quiz.id')
    cId   = model.get('case.id')
    if scope == 'quiz'
      @transitionTo('quiz', qId)
    else
      if scope == 'case'
        @transitionTo('quiz', cId)
      else
        if scope == 'homework'
          @transitionTo('homework_progress', hId)
        else
          @transitionTo('unit.index', uId, {queryParams: {scope: scope}})



