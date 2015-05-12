`import Ember from "ember";`

# For more information see: http://emberjs.com/guides/routing/

CourseRoute = Ember.Route.extend
  model: (params)->
    @store.find 'course', params.id

  renderTemplate: ->
    @render()
    @render 'groups/show_in_sidebar',  outlet: 'right_sidebar'
    @render 'course_progress/pivot',   outlet: 'pivot'

  actions:
    willTransition: ->
      $('.ui.right.sidebar').removeClass('overlay visible')
      $('#hide-sidebar').css('display','none')
      $('.container').removeClass('left_content')






`export default CourseRoute;`
