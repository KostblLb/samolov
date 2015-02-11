Samolov.ProgressMixin = Ember.Mixin.create

  maxPoints: DS.attr 'number'
  points:    DS.attr 'number'

  success: (->
    "#{@get 'points'}/#{@get 'maxPoints'}"
  ).property('points', 'maxPoints')

  color: (->
    step = @get('maxPoints') / 3
    switch
      when @get('points') < step                                then 'red'
      when @get('points') < (2 * step) && @get('points') > step then 'yellow'
      when @get('points') > step                                then 'green'
  ).property('points', 'maxPoints')