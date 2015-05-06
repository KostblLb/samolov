Samolov.SubscribtionRoute = Ember.Route.extend

  model: (params)->
    @store.find 'subscribtion', params.id