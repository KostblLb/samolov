Samolov.TableAdapter = Samolov.SubtaskAdapter.extend()

Samolov.Table = Samolov.Subtask.extend
  rows: DS.hasMany 'row'
  col_names: DS.attr()

  partialName: 'partials/tasks/table'