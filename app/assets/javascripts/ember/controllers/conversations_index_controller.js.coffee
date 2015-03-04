# for more details see: http://emberjs.com/guides/controllers/

Samolov.ConversationsIndexController = Ember.ArrayController.extend

  actions:
    delete: (conversation)->
      conversation.destroyRecord().then =>
        @transitionToRoute('conversations')


