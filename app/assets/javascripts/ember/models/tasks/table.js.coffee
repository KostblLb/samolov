Samolov.TableAdapter = Samolov.TaskAdapter.extend()

Samolov.Table = Samolov.Task.extend
  rows: DS.hasMany 'row'
  col_names: DS.attr()