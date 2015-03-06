# for more details see: http://emberjs.com/guides/controllers/

Samolov.ConversationsIndexController = Ember.ArrayController.extend

  sortProperties: ['updated_at'],
  sortAscending: false

  actions:
    delete: (conversation)->
      conversation.destroyRecord().then =>
        @transitionToRoute('conversations')

