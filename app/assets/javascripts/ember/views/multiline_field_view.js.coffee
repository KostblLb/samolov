Samolov.MultilineField = Ember.TextField.extend

  change: ->
    lines   = @get('object.lines')
    indx = @get('index')
    lines[indx] = @value
