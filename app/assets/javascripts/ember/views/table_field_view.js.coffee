Samolov.TableField = Ember.TextField.extend

  change:->
    cells   = @get('object.cells')
    indx = @get('index')
    cells[indx] = @value


