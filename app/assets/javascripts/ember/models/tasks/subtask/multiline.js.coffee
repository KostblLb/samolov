Samolov.MultilineAdapter = Samolov.SubtaskAdapter.extend()

Samolov.Multiline = Samolov.Subtask.extend
  lines: DS.attr()
  lineNames: DS.attr()
  partialName: 'partials/homework/state/in_progress/multiline'
  isCompletePartialName: 'partials/homework/state/review/multiline'
