`import DS from "ember-data";`

Section = DS.Model.extend
  from:   DS.attr 'number', defaultValue: 0
  to:     DS.attr 'number', defaultValue: 999
  points: DS.attr 'number', defaultValue: 0

  scale: DS.belongsTo 'scale'

  name: (->
    "#{@get 'from'} - #{@get 'to'}"
  ).property('from', 'to')

`export default Section;`
