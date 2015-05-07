`import DS from "ember-data"`
`import Subtask from "../../subtask"`

Fish = Subtask.extend
  fishBody: DS.attr 'string'
  fishHead: DS.attr 'string'
  partialName: 'partials/homework/state/in_progress/fish'
  isCompletePartialName: 'partials/homework/state/review/fish'

  isFilled: (->
    @get('fishBody')? && @get('fishBody') != '' && @get('fishHead')? && @get('fishHead') != ''
  ).property('fishBody', 'fishHead')

`export default Fish;`
