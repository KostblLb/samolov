# For more information see: http://emberjs.com/guides/routing/

Samolov.QuestionRoute = Ember.Route.extend
  model: (params)->
    @store.find 'question', params.id