`import Ember from "ember"`

ConversationsNewController = Ember.ObjectController.extend
  queryParams: ['sender_id']
  sender_id: null

  actions:
    create: ->
      @model.save().then =>
        @model.get('messages.lastObject').deleteRecord() if @model.get('messages.lastObject.isNew')
        $("#message_error").addClass('hide_error')
        $("#users_error").addClass('hide_error')
        @transitionToRoute('conversations')
      , =>
        if (@get('errors.content').findBy('attribute', 'user_ids'))
          $("#users_error").removeClass('hide_error')
        else
          $("#users_error").addClass('hide_error')
        if (@get('errors.content').findBy('attribute', 'messages'))
          $("#message_error").removeClass('hide_error')
        else
          $("#message_error").addClass('hide_error')

`export default ConversationsNewController`
