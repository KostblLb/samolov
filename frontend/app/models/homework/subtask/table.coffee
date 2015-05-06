`import DS from "ember-data";`
`import Subtask from "../../subtask"`

Table = Subtask.extend
  col_names: DS.attr()

  partialName: 'partials/homework/state/in_progress/table'
  isCompletePartialName: 'partials/homework/state/review/table'

  rows: DS.hasMany 'homework/subtask/row'

`export default Table`
