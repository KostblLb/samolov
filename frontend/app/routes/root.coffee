`import Ember from 'ember'`

RootRoute = Ember.Route.extend

  beforeModel: ->
    if Ember.isBlank(window.myId)
      @transitionTo('directors')
    else
      @transitionTo('courses')

`export default RootRoute`
