`import Ember from 'ember'`

ApplicationRoute = Ember.Route.extend

  actions:
    loading: ->
      console.log 'loading'
      $('html').append('<div class="absoluteSpinner" ></div>')
      @router.one 'didTransition', ->
        $('html .absoluteSpinner').remove()

`export default ApplicationRoute`
