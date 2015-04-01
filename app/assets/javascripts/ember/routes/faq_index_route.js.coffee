# For more information see: http://emberjs.com/guides/routing/

Samolov.FaqIndexRoute = Ember.Route.extend
  model: ->
    @store.find('faq')