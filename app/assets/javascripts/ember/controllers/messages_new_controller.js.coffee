# for more details see: http://emberjs.com/guides/controllers/

Samolov.MessagesNewController = Ember.ObjectController.extend
  queryParams: ['recipient_id']
  recipient_id: null
  actions:
    save: ->
      @model.save().then =>
        @transitionToRoute 'messages.index', queryParams: {scope: 'outbox'}