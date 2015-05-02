`import Ember from 'ember'`
`import Resolver from 'ember/resolver'`
`import loadInitializers from 'ember/load-initializers'`
`import config from './config/environment'`

Ember.MODEL_FACTORY_INJECTIONS = true

App = Ember.Application.extend
  modulePrefix: config.modulePrefix
  podModulePrefix: config.podModulePrefix
  Resolver: Resolver


loadInitializers App, config.modulePrefix

Ember.Handlebars.registerBoundHelper 'inc', (integer) ->
  integer + 1

Ember.Handlebars.registerHelper 'ifEql', (a,b, options) ->
  if a == b
    options.fn this
  else
    options.inverse this

Ember.Handlebars.registerHelper 'ifNotEql', (a,b, options) ->
  if a != b
    options.fn this
  else
    options.inverse this

Ember.Handlebars.registerHelper 'unlessFirstItem', (options) ->
  if options.data.view.contentIndex != 0
    options.fn this
  else
    if options.inverse?
      options.inverse this
    else
      null

Ember.Handlebars.registerHelper 'index_of',(context, ndx)->
  context[ndx]


`export default App`
