Samolov.Message = DS.Model.extend
  body: DS.attr 'string'

  conversation: DS.belongsTo 'conversation'
  receipts: DS.hasMany 'receipt'
  sender:    DS.belongsTo 'user', async: true