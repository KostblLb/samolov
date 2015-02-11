Samolov.UnitProgress = DS.Model.extend Samolov.ProgressMixin,
  state: DS.attr 'number'
  unit: DS.belongsTo 'unit', async: true



