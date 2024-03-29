`import Ember from "ember";`

HomeworkProgressRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'homework_progress', params.homework_progress_id

  afterModel: (model, params) ->
    model.reload()
    uId = model.get('unitId')
    @transitionTo('homework_progress', model.get('id'))

`export default HomeworkProgressRoute;`
