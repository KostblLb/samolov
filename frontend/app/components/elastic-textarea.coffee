`import Ember from 'ember'`

ElasticTextareaComponent = Ember.Component.extend

  didInsertElement: ->
    @$('textarea').autogrow()

`export default ElasticTextareaComponent`
