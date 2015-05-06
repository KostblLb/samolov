`import Ember from "ember";` 
 
# For more information see: http://emberjs.com/guides/routing/

CourseProgressRoute = Ember.Route.extend
  model: (params)->
    @store.find 'course_progress', params.id


 
`export default CourseProgressRoute;`
