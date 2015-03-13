Samolov.SelectAdapter = Samolov.SubtaskAdapter.extend()

Samolov.Select = Samolov.Subtask.extend

  single:  DS.attr 'boolean'
  options: DS.hasMany 'option'
  answers: DS.hasMany 'option'

  partialName: 'partials/tasks/select'