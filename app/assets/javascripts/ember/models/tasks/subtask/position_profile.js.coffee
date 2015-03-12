Samolov.PositionProfileAdapter = Samolov.SubtaskAdapter.extend()

Samolov.PositionProfile = Samolov.Subtask.extend
  sex:              DS.attr 'string'
  age:              DS.attr 'string'
  appearance:       DS.attr 'string'
  otherPhysical:    DS.attr 'string'
  partialName: 'partials/tasks/position_profile'