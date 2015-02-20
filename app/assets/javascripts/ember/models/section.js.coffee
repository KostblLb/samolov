# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.Section = DS.Model.extend
  from:   DS.attr 'number', defaultValue: 0
  to:     DS.attr 'number', defaultValue: 999
  points: DS.attr 'number', defaultValue: 0

  scale: DS.belongsTo 'scale'

  name: (->
    "#{@get 'from'} - #{@get 'to'}"
  ).property('from', 'to')