
Samolov.ConversationsIndexRoute = Ember.Route.extend Samolov._PaginatedRouteMixin,
  model: (params) ->
    @store.find('conversation', params).then(@_includePagination)