`import Ember from "ember";` 
 
# For more information see: http://emberjs.com/guides/routing/

UsersIndexRoute = Ember.Route.extend
  model: ->
    @store.find 'user'
 
`export default UsersIndexRoute;`
