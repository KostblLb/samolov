`import Ember from "ember";` 
 
# for more details see: http://emberjs.com/guides/views/

FreeView = Ember.View.extend
  templateName: 'free'

  didInsertElement: ->
    @_super()
    $('.ui.video').video()

 
`export default FreeView;`
