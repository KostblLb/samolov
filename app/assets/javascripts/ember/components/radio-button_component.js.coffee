# for more details see: http://emberjs.com/guides/components/

Samolov.RadioButtonComponent = Ember.Component.extend
  didInsertElement: ->
    @_super()
    @$('.ui.checkbox').checkbox()

  click : ->
    @set "selection", @get('value')
  checked: (->
    return @get("value") == @get("selection")
  ).property()
