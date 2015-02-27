# For more information see: http://emberjs.com/guides/routing/

Samolov.UnitRoute = Ember.Route.extend

  lock: true

  model: (params)->
    @store.find('unit', params.unit_id)

  afterModel: (model, params) ->
    uId= model.get('id')
    scope= model.get('myProgress.state')
    hId = model.get('myProgress.homeworkProgress.id')
    qId = model.get('quiz.id')
    cId = model.get('case.id')
    if scope == 'quiz'
      @transitionTo('quiz', qId)
    else
      if scope == 'case'
        @transitionTo('quiz', cId)
      else
        if scope == 'homework'
          @transitionTo('homework_progress', hId)
        else
          @transitionTo('unit', uId, {queryParams: {scope: scope}})

  actions:
    queryParamsDidChange: (paramsChanged, params)->
      @customRender(params.scope || 'video') unless @lock


  customRender: (scope) ->
    @render()
    @render "unit/#{scope}", into: 'unit'


  renderTemplate: (controller, model)->
    @lock = false
    @customRender(controller.scope)


