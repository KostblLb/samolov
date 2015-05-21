`import DS from 'ember-data'`

Inquire = DS.Model.extend

  name:        DS.attr 'string'
  email:       DS.attr 'string'
  phone:       DS.attr 'string'
  createdAt:   DS.attr 'string'

  dateNow: ->
    moment()

  timeLeft: (->
    moment("20150601", "YYYYMMDD").fromNow(true);
  ).property('dateNow')

`export default Inquire`
