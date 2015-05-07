`import Ember from "ember";`

TableField = Ember.TextArea.extend

  change:->
    cells   = @get('object.cells').slice(0)
    indx = @get('index')
    cells[indx] = @value
    @set('object.cells', cells)
  didInsertElement: ->
    @$().autogrow()

`export default TableField;`
