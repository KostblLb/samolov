`import Ember from 'ember'`

EducationRoute = Ember.Route.extend

  beforeModel: ->
    if Ember.isBlank(window.myId)
      window.location.href = "/users/sign_in"

`export default EducationRoute`
