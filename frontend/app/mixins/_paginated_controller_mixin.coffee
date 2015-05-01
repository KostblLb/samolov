`import Ember from "ember";` 
 
_PaginatedControllerMixin = Ember.Mixin.create
  queryParams: ['page', 'per_page']
  page: 1
  per_page: 5
  available_per_page: [10, 20, 50, 100]


  perPageSelectHandler: (->
    @transitionToRoute queryParams: {per_page: @per_page}
  ).observes('per_page')


  previousPageEnable: (->
    @page > 1
  ).property('page')

  nextPage: (->
    @page + 1
  ).property('page')

  previousPage: (->
    @page - 1
  ).property('page')

  nextPageEnable: (->
    @page < @get('content').pages.length
  ).property('page')

  needPaginate: (->
    @get('content').pages.length > 1
  ).property('content.pages')
 
`export default _PaginatedControllerMixin;`
