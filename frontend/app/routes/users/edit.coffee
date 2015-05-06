`import Ember from "ember";` 
 
# For more information see: http://emberjs.com/guides/routing/

UsersEditRoute = Ember.Route.extend
  model: ->
    @store.find 'user', window.myId
 
`export default UsersEditRoute;`
