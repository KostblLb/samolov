`import Ember from "ember";` 
 
# For more information see: http://emberjs.com/guides/routing/

CoursesRoute = Ember.Route.extend
  model: ->
    @store.find 'course'
 
`export default CoursesRoute;`
