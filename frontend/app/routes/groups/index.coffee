`import Ember from "ember";` 
 
# For more information see: http://emberjs.com/guides/routing/

GroupsIndexRoute = Ember.Route.extend
  model: ->
    @store.find('group', scope: 'as_teacher')
 
`export default GroupsIndexRoute;`
