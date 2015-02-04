# for more details see: http://emberjs.com/guides/components/

Samolov.UiVideoComponent = Ember.Component.extend
  classNames: ['ui', 'video']
  didInsertElement: () ->
    @$().attr 'data-url', @data_url
    @$().video()

