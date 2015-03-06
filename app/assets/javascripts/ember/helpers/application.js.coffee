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
    options.inverse this

