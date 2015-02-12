Samolov.UnitProgress = DS.Model.extend Samolov.ProgressMixin,
  state: DS.attr 'string'
  unit: DS.belongsTo 'unit', async: true



