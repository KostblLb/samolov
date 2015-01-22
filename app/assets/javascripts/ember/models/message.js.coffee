Samolov.Message = DS.Model.extend
  body: DS.attr 'string'

  sender:    DS.belongsTo 'user', async: true
  recipient: DS.belongsTo 'user', async: true
