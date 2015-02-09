# for more details see: http://emberjs.com/guides/components/

Samolov.RadioButtonComponent = Ember.Component.extend
  didInsertElement: ->
    @_super()
    @$('.ui.checkbox').checkbox()

  click : ->
    needAdd = @get("selection").indexOf(@get("value")) == -1
    @get('selection').clear() if @get('single')
    if needAdd
      @get('selection').pushObject @get('value')
    else
      @get('selection').removeObject @get('value')
  checked: (->
    return @get("selection").indexOf(@get("value")) != -1
  ).property()
