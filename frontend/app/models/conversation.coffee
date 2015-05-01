`import DS from "ember-data";`
`import FormattedTimestampMixin from "../mixins/formatted_timestamp_mixin"`

Conversation = DS.Model.extend FormattedTimestampMixin,
  subject: DS.attr 'string'
  created_at: DS.attr 'string'
  updated_at: DS.attr 'string'
  hasUnread: DS.attr 'boolean'

  users: DS.hasMany 'user'
  messages: DS.hasMany 'message'

`export default Conversation;`
