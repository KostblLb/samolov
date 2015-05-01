`import DS from "ember-data";`
`import Subtask from "../../subtask"`

PositionProfile = Subtask.extend

  profileCompulsory: DS.belongsTo 'profile'
  profileDesirable:  DS.belongsTo 'profile'

  partialName: 'partials/homework/state/in_progress/position_profile'
  isCompletePartialName: 'partials/homework/state/review/position_profile'

`export default PositionProfile;`
