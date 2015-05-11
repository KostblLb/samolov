`import Ember from "ember";`
`import _PaginatedRouteMixin from "../../mixins/_paginated_route_mixin"`

ConversationsIndexRoute = Ember.Route.extend _PaginatedRouteMixin,
  model: (params) ->
    @store.find('conversation', {page: 1, per_page: 15}).then(@_includePagination)

  setupController: (controller, model)->
    controller.set 'model', model
    controller.set 'page', 1
`export default ConversationsIndexRoute;`
