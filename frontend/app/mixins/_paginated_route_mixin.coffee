`import Ember from "ember";` 
 
_PaginatedRouteMixin = Ember.Mixin.create
  paginationRoute: Ember.required(String)

  queryParams:
    page:
      refreshModel: true
      replace: true
    per_page:
      refreshModel: true
      replace: true

  getParams: (params) ->
    queryParams = {}
    queryParams['page']     = params['page']     if params['page']
    queryParams['per_page'] = params['per_page'] if params['per_page']
    queryParams


# This function is for use in a route that calls find() to get a
# paginated collection of records.  It takes the pagination metadata
# from the store and puts it into the record array.
  _includePagination: (records) =>
    metadata = records.store.typeMapFor(records.type).metadata

    # put the pagination content directly on the collection
    pages = []
    for i in [1..metadata.pagination.total_pages]
      klass = if i == metadata.pagination.current_page then 'item active' else 'item'
      page = {
        num: i
        class: klass
      }
      pages.push page

    records.set "pagination", metadata.pagination
    records.set "pages", pages

    records
 
`export default _PaginatedRouteMixin;`
