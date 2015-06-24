`import Ember from "ember";`

# For more information see: http://emberjs.com/guides/routing/

CourseRoute = Ember.Route.extend
  model: (params)->
    @store.find 'course', params.id

  renderTemplate: ->
    @render()
    @render 'partials/_course_sidebar',  outlet: 'right_sidebar'


`export default CourseRoute;`
