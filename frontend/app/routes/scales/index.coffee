`import Ember from "ember";` 
 
# For more information see: http://emberjs.com/guides/routing/

ScalesIndexRoute = Ember.Route.extend
  model: ->
    @store.find 'scale'

 
`export default ScalesIndexRoute;`
