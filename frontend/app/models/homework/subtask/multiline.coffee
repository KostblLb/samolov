`import DS from "ember-data";`
`import Subtask from "../../subtask"`

Multiline = Subtask.extend
  lines: DS.attr()
  lineNames: DS.attr()
  partialName: 'partials/homework/state/in_progress/multiline'
  isCompletePartialName: 'partials/homework/state/review/multiline'


`export default Multiline`
