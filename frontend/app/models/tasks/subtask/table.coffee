`import DS from "ember-data";`
`import Subtask from "../../subtask"`

Table = Subtask.extend
  rows: DS.hasMany 'row'
  col_names: DS.attr()

  partialName: 'partials/homework/state/in_progress/table'
  isCompletePartialName: 'partials/homework/state/review/table'

`export default Table`
