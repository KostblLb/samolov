`import DS from "ember-data";`
`import FormattedTimestampMixin from "../mixins/formatted_timestamp_mixin"`



Webinar = DS.Model.extend FormattedTimestampMixin,
  link: DS.attr 'string'
  start: DS.attr 'date'
  video: DS.attr 'string'

  format: 'DD-MM-YYYY в HH:mm'

  convertDate: (field) ->
    date = @.get field
    format = @.get 'format'
    moment(date).format format


  formattedStart: (->
    @convertDate 'start'
  ).property('start', 'format')

`export default Webinar;`
