`import Ember from "ember";`
`import _PaginatedControllerMixin from "../../mixins/_paginated_controller_mixin"`

ConversationsIndexController = Ember.ArrayController.extend _PaginatedControllerMixin,

  sortProperties: ['updated_at'],
  sortAscending: false

  actions:
    delete: (conversation)->
      conversation.destroyRecord().then =>
        @transitionToRoute('conversations')

 `export default ConversationsIndexController;`
