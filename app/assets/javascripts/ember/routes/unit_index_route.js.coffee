# For more information see: http://emberjs.com/guides/routing/

Samolov.UnitIndexRoute = Ember.Route.extend
  queryParams:
    scope:
      refreshModel: true

  afterModel: (model, params) ->
    uId   = model.get('id')
    if params.queryParams.scope
      scope = params.queryParams.scope
    else
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
        if scope == 'homework' || scope == 'done'
          @transitionTo('homework_progress', hId)
        else
          @transitionTo('unit.index', uId, {queryParams: {scope: scope}})




