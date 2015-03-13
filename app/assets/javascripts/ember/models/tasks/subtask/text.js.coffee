Samolov.TextAdapter = Samolov.SubtaskAdapter.extend()

Samolov.Text = Samolov.Subtask.extend
  answer: DS.attr 'string'
  partialName: 'partials/homework/state/in_progress/text'
  isCompletePartialName: 'partials/homework/state/review/text'