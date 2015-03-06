# for more details see: http://emberjs.com/guides/components/

Samolov.UserSelectComponent = Ember.Component.extend
  didInsertElement: ->
    @$(".js-example-basic-multiple").select2()