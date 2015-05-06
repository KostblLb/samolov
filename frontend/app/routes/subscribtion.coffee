`import Ember from "ember";` 
 
SubscribtionRoute = Ember.Route.extend

  model: (params)->
    @store.find 'subscribtion', params.id
 
`export default SubscribtionRoute;`
