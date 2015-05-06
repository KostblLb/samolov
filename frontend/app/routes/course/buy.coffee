`import Ember from "ember";` 
 
# For more information see: http://emberjs.com/guides/routing/

CourseBuyRoute = Ember.Route.extend
  model: ->
    course = @modelFor 'course'
    @store.createRecord 'order', course: course

 
`export default CourseBuyRoute;`
