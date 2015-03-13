Samolov.FishAdapter = Samolov.SubtaskAdapter.extend()

Samolov.Fish = Samolov.Subtask.extend
  fishBody: DS.attr 'string'
  fishHead: DS.attr 'string'
  partialName: 'partials/homework/state/in_progress/fish'
  isCompletePartialName: 'partials/homework/state/review/fish'