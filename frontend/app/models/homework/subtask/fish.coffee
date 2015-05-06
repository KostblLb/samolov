`import DS from "ember-data"`
`import Subtask from "../../subtask"`

Fish = Subtask.extend
  fishBody: DS.attr 'string'
  fishHead: DS.attr 'string'
  partialName: 'partials/homework/state/in_progress/fish'
  isCompletePartialName: 'partials/homework/state/review/fish'

`export default Fish;`
