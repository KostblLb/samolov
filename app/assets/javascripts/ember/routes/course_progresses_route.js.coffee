# For more information see: http://emberjs.com/guides/routing/

Samolov.CourseProgressRoute = Ember.Route.extend
  model: (params)->
    @store.find 'course_progress', params.id

