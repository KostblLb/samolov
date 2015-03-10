Samolov.MultilineField = Ember.TextField.extend
bindAttrs: (->
  lines   = @get('object.cells')
  indx = @get('index')
  if @value
  else
    cells[indx] = @value
).on('didInsertElement')


change: ->
  lines   = @get('object.cells')
  indx = @get('index')
  cells[indx] = @value