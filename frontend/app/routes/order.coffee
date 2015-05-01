`import Ember from "ember";` 
 
# For more information see: http://emberjs.com/guides/routing/

OrderRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'order', params.id
 
`export default OrderRoute;`
