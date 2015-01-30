#= require jquery
#= require semantic-ui
#= require moment
#= require moment/ru.js
#= require handlebars
#= require ember
#= require ember-data
#= require_self
#= require ./samolov

# for more details see: http://emberjs.com/guides/application/
window.Samolov = Ember.Application.create
  rootElement: '#cabinet_app'

Ember.Application.initializer
  name: 'curretUser',
  after: 'store'

  initialize: (container, application) ->
    # Wait until all of the following promises are resolved
    application.deferReadiness()
    if window.myId?
      container.lookup('store:main').find('user', window.myId).then (user)->
        container.register 'user:current', user, {instantiate: false, singleton: true}
        container.register 'user:not_current', user, {instantiate: false, singleton: true}

        # Inject the namespace into controllers and routes
        container.injection 'route', 'currentUser', 'user:current'
        container.injection 'model', 'currentUser', 'user:current'
        container.injection 'controller', 'currentUser', 'user:current'

        # Continue the Application boot process, allowing other Initializers to run
        application.advanceReadiness();
