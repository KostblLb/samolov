Samolov.UnitProgress = DS.Model.extend
  state: DS.attr 'number'
  unit: DS.belongsTo 'unit', async: true



