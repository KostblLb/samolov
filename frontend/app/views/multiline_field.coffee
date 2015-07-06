`import Ember from "ember";`

MultilineField = Ember.TextArea.extend
  classNameBindings: ['multilineareawidth'],
  multilineareawidth: true

  change: ->
    lines = @get('object.lines').slice(0)
    indx = @get('index')
    lines[indx] = @value
    @set('object.lines', lines)


`export default MultilineField;`
