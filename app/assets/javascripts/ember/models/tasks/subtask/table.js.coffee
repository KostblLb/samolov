Samolov.TableAdapter = Samolov.SubtaskAdapter.extend()

Samolov.Table = Samolov.Subtask.extend
  rows: DS.hasMany 'row'
  col_names: DS.attr()

  partialName: 'partials/homework/state/in_progress/table'
  isCompletePartialName: 'partials/homework/state/review/table'