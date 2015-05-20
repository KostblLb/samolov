`import Ember from 'ember'`

DirectorsRoute = Ember.Route.extend

  model: ->
    @store.createRecord 'inquire'

  actions:
    willTransition: (transition)->
      @currentModel.deleteRecord() if @currentModel.get('isNew')

`export default DirectorsRoute`
