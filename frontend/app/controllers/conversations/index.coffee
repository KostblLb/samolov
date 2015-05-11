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
      $.ajax("/api/v1/conversations.json?page=#{page}", 'GET').then (nextPage)=>
        nextPage.conversations.forEach (item)=>
          @get('model').pushObject(item)
        @set('page', page)


`export default ConversationsIndexController;`
