`import Ember from "ember";`
`import _PaginatedControllerMixin from "../../mixins/_paginated_controller_mixin"`

ConversationsIndexController = Ember.ArrayController.extend _PaginatedControllerMixin,

  sortProperties: ['updated_at'],
  sortAscending: false

  actions:
    delete: (conversation)->
      conversation.destroyRecord().then =>
        @transitionToRoute('conversations')

    showMore: (page)->
      @store.find('conversation', {page: page}).then (nextPage) =>
        @get('model').pushObjects(nextPage.content)
        @set('page', page)


`export default ConversationsIndexController;`
