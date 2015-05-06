`import Ember from "ember";` 
 
# For more information see: http://emberjs.com/guides/routing/

ScalesNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'scale'
 
`export default ScalesNewRoute;`
