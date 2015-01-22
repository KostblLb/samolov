# For more information see: http://emberjs.com/guides/routing/

Samolov.MessagesNewRoute = Ember.Route.extend
  queryParams:
    recipient_id:
      refreshModel: true

  beforeModel: ->
    @store.find 'user'

  model: (params)->
    message = @store.createRecord 'message'
    if params.recipient_id?
      @store.find('user', params.recipient_id).then (recipient) =>
        message.set 'recipient', recipient
    message

  setupController: (controller, model) ->
    console.log model
    controller.set 'model', model
    controller.set 'users', @store.filter 'user', (user) =>
      user.id != @currentUser.id
