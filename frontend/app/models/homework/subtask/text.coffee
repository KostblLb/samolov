`import DS from "ember-data";`
`import Subtask from "../../subtask"`

Text = Subtask.extend
  answer: DS.attr 'string'
  partialName: 'partials/homework/state/in_progress/text'
  isCompletePartialName: 'partials/homework/state/review/text'

  isFilled: (->
    @get('answer')? && @get('answer') != ''
  ).property('answer')

`export default Text`
