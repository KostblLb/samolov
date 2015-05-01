`import Ember from "ember";`
`import _PaginatedRouteMixin from "../../mixins/_paginated_route_mixin"`

ConversationsIndexRoute = Ember.Route.extend _PaginatedRouteMixin,
  model: (params) ->
    @store.find('conversation', params).then(@_includePagination)

`export default ConversationsIndexRoute;`
