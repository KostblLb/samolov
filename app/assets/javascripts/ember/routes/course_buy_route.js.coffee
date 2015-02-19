# For more information see: http://emberjs.com/guides/routing/

Samolov.CourseBuyRoute = Ember.Route.extend
  model: ->
    course = @modelFor 'course'
    @store.createRecord 'order', course: course
