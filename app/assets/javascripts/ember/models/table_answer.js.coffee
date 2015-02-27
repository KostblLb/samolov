Samolov.TableAnswer = DS.Model.extend

  rows: DS.hasMany 'row'
  description: DS.attr 'string'
  order: DS.attr 'number'