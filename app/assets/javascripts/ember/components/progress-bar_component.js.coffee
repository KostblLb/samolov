# for more details see: http://emberjs.com/guides/components/

Samolov.ProgressBarComponent = Ember.Component.extend
  percent: 100
  classNames: ['ui', 'green', 'progress' ]
  didInsertElement: () ->
    @$().progress(percent: @percent)


