Samolov.TableField = Ember.TextField.extend

  bindAttrs: (->
    cells   = @get('object.cells')
    indx = @get('index')
    cells[indx] = @value
  ).on('didInsertElement')


  change: ->
    cells   = @get('object.cells')
    indx = @get('index')
    cells[indx] = @value
