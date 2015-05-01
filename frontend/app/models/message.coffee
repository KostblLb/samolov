`import DS from "ember-data";`
`import FormattedTimestampMixin from "../mixins/formatted_timestamp_mixin"`

Message = DS.Model.extend FormattedTimestampMixin,
  body: DS.attr 'string'
  created_at: DS.attr 'string'

  conversation: DS.belongsTo 'conversation'
  receipts: DS.hasMany 'receipt'
  sender:    DS.belongsTo 'user', async: true

  previewMessage: (->
    if @get('body') != null && @get('body').length > 10
      return @get('body').substring(0,235) + '...'
    else
      return @get('body')
  ).property('body')

`export default Message;`
