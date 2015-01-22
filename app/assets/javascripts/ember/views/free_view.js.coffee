# for more details see: http://emberjs.com/guides/views/

Samolov.FreeView = Ember.View.extend
  templateName: 'free'

  didInsertElement: ->
    @_super()
    $('.ui.video').video()
