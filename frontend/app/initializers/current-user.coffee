# Takes two parameters: container and app
initialize = (container, application) ->
  # Wait until all of the following promises are resolved
  unless Ember.isBlank(window.myId)
    application.deferReadiness()
    container.lookup('store:main').find('user', window.myId).then (user)->
      container.register 'user:current', user, {instantiate: false, singleton: true}

      # Inject the namespace into controllers and routes
      container.injection 'route', 'currentUser', 'user:current'
      container.injection 'model', 'currentUser', 'user:current'
      container.injection 'controller', 'currentUser', 'user:current'

      # Continue the Application boot process, allowing other Initializers to run
      application.advanceReadiness();

CurrentUserInitializer =
  after: 'store'
  name: 'current-user'
  initialize: initialize

`export {initialize}`
`export default CurrentUserInitializer`
