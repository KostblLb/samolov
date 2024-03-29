`import DS from "ember-data";`
`import Subtask from "../../subtask"`

Select = Subtask.extend
  single:  DS.attr 'boolean'
  name:    DS.attr 'string'

  partialName: 'partials/homework/state/in_progress/select'
  isCompletePartialName: 'partials/homework/state/review/select'

  options: DS.hasMany 'homework/subtask/option'
  answers: DS.hasMany 'homework/subtask/option'

  isFilled: (->
    @get('options').filterBy('isFilled', true).length > 0
  ).property('answers.@each.isFilled')


`export default Select;`
