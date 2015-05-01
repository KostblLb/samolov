`import Ember from "ember";` 
 
# For more information see: http://emberjs.com/guides/routing/

GroupsShowRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'group', params.id

  setupController: (controller, model)->
    controller.set 'model', model
    controller.set 'scales', @store.find('scale')
 
`export default GroupsShowRoute;`
