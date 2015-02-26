# For more information see: http://emberjs.com/guides/routing/

Samolov.UnitRoute = Ember.Route.extend
  model: (params)->
    @store.find('unit', params.unit_id)

  afterModel: (model, params) ->
    uId= model.get('id')
    scope = model.get('myProgress.state')

    qId = model.get('quiz.id')
    cId = model.get('case.id')
    if scope == 'quiz'
      @transitionTo('quiz', qId)
    else
      if scope == 'case'
        @transitionTo('quiz', cId)
      else
        @transitionTo('unit', uId, {queryParams: {scope: scope}})



