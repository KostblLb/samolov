`import Ember from "ember"`

CourseIndexController = Ember.ObjectController.extend
  actions:
    openStep: (unit, step)->
      @transitionToRoute('unit', unit, {queryParams: {scope: step}})

    showUnitBeginning: ->
      $('.basic.modal').modal('show')

    showSideBar: ->
      $('.ui.right.sidebar').addClass('overlay visible')
      $('#hide-sidebar').css('display','block')
      $('.container').addClass('left_content')

`export default CourseIndexController`
