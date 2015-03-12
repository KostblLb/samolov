Samolov.TableField = Ember.TextField.extend


  bindAttrs: (->
    cells   = @get('object.cells')
    indx = @get('index')

    cells[indx] = @value unless @value
  ).on('didInsertElement')

  change:->
    cells   = @get('object.cells')
    indx = @get('index')
    cells[indx] = @value


