Samolov.MultilineAdapter = Samolov.SubtaskAdapter.extend()

Samolov.Multiline = Samolov.Subtask.extend
  lines: DS.attr()
  lineNames: DS.attr()
  partialName: 'partials/tasks/multiline'
  isCompletePartialName: 'partials/tasks_complete/multiline'
