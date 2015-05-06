`import DS from "ember-data";`

Receipt = DS.Model.extend
  isRead: DS.attr 'boolean'

  recipient: DS.belongsTo 'user'
  message: DS.belongsTo 'message'

`export default Receipt;`
