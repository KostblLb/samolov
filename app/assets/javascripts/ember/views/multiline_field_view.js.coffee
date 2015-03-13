Samolov.MultilineField = Ember.TextField.extend
  bindAttrs: (->
    lines   = @get('object.lines')
    indx = @get('index')
    if lines[indx]
      @set @value, line[index]
    else
      lines[indx] = @value
  ).on('didInsertElement')


  change: ->
    lines   = @get('object.lines')
    indx = @get('index')
    lines[indx] = @value
