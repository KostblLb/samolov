Samolov.TextAdapter = Samolov.SubtaskAdapter.extend()

Samolov.Text = Samolov.Subtask.extend
  answer: DS.attr 'string'
  partialName: 'partials/tasks/text'