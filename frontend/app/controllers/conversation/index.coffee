`import Ember from "ember";` 
 
  # for more details see: http://emberjs.com/guides/controllers/

ConversationIndexController = Ember.ObjectController.extend

  actions:
    addMessage: ->
      if @get('messages.lastObject.body')?
        $("#message_error").addClass('hide_error')
      else
        $("#message_error").removeClass('hide_error')
      if @get('messages.lastObject.body')?
        @model.get('messages.lastObject').save()
        message = @store.createRecord 'message'
        @model.get('messages').pushObject message
    removeMessage: (message) ->
      message.destroyRecord()

 
 `export default ConversationIndexController;`
