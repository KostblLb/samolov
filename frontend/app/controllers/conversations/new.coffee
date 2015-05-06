`import Ember from "ember"`

ConversationsNewController = Ember.ObjectController.extend
  queryParams: ['sender_id']
  sender_id: null

  actions:
    create: ->
      @model.save().then =>
        @model.get('messages.lastObject').deleteRecord() if @model.get('messages.lastObject.isNew')
        @transitionToRoute('conversations')

      if (@get('content.errors')['users'].length > 0)
        $("#users_error").removeClass('hide_error')
      else
        $("#users_error").addClass('hide_error')

      if @get('messages.lastObject.body')?
        $("#message_error").addClass('hide_error')
      else
        $("#message_error").removeClass('hide_error')

`export default ConversationsNewController`
