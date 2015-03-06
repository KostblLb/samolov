Samolov.Receipt = DS.Model.extend
  isRead: DS.attr 'boolean'

  recipient: DS.belongsTo 'user'
  message: DS.belongsTo 'message'


