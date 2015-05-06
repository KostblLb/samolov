`import Ember from "ember";` 
 
EditScaleControllerMixin = Ember.Mixin.create
  actions:
    addSection: ->
      section = @store.createRecord 'section'
      @model.get('sections').pushObject section
    removeSection: (section) ->
      @model.get('sections').removeObject section
    save: ->
      @model.save().then =>
        @transitionToRoute 'scales'

 
`export default EditScaleControllerMixin;`
