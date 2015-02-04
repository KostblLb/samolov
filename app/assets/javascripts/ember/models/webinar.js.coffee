# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.Webinar = DS.Model.extend
  link: DS.attr 'string'
  start: DS.attr 'date'
  end:   DS.attr 'date'

  format: 'DD-MM-YYYY в HH:mm'

  convertDate: (field) ->
    date = @.get field
    format = @.get 'format'
    moment(date).format format


  formattedStart: (->
    @convertDate 'start'
  ).property('start', 'format')

  formattedEnd: (->
    @convertDate 'end'
  ).property('end', 'format')