Samolov.PositionProfileAdapter = Samolov.SubtaskAdapter.extend()

Samolov.PositionProfile = Samolov.Subtask.extend

  profileCompulsory: DS.belongsTo 'profile'
  profileDesirable:  DS.belongsTo 'profile'

  partialName: 'partials/homework/state/in_progress/position_profile'