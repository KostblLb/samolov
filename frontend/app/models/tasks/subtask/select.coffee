`import DS from "ember-data";`
`import Subtask from "../../subtask"`

Select = Subtask.extend

  single:  DS.attr 'boolean'
  name:    DS.attr 'string'
  options: DS.hasMany 'option'
  answers: DS.hasMany 'option'

  partialName: 'partials/homework/state/in_progress/select'
  isCompletePartialName: 'partials/homework/state/review/select'

`export default Select;`
