`import Ember from "ember";` 
 
# For more information see: http://emberjs.com/guides/routing/

ScaleRoute = Ember.Route.extend
  model: (params)->
    @store.find 'scale', params.id
 
`export default ScaleRoute;`
