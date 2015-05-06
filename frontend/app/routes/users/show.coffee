`import Ember from "ember";` 
 
# For more information see: http://emberjs.com/guides/routing/

UsersShowRoute = Ember.Route.extend
  model: (params)->
    @store.find 'user', params.id
 
`export default UsersShowRoute;`
