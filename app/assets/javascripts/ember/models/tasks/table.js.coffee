Samolov.TableAdapter = Samolov.TaskAdapter.extend()

Samolov.Table = Samolov.Task.extend
  rows: DS.hasMany 'row'
  table_head: DS.attr()