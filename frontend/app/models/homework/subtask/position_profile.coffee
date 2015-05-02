`import DS from "ember-data";`
`import Subtask from "../../subtask"`

PositionProfile = Subtask.extend
  partialName: 'partials/homework/state/in_progress/position_profile'
  isCompletePartialName: 'partials/homework/state/review/position_profile'

  profileCompulsory: DS.belongsTo 'homework/subtask/profile'
  profileDesirable:  DS.belongsTo 'homework/subtask/profile'

`export default PositionProfile;`
