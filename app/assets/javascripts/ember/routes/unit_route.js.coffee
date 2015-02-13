# For more information see: http://emberjs.com/guides/routing/

Samolov.UnitRoute = Ember.Route.extend

  lock: true

  model: (params)->
     @store.find 'unit', params.unit_id

  actions:
    queryParamsDidChange: (paramsChanged, params)->
      @customRender(params.scope || 'video') unless @lock

    reloadModel: (model)->
      @controller.get('model').reload().then (model)


  customRender: (scope) ->
    @render()
    @render "unit/#{scope}", into: 'unit'

  renderTemplate: (controller, model)->
    @lock = false
    @customRender(controller.scope)

  beforeRender:->
    @reloadModel(unit)