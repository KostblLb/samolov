`import DS from "ember-data";`
`import Subtask from "../../subtask"`

Multiline = Subtask.extend
  lines: DS.attr()
  lineNames: DS.attr()
  partialName: 'partials/homework/state/in_progress/multiline'
  isCompletePartialName: 'partials/homework/state/review/multiline'

  isFilled: (->
    @get('lines').filterBy('',null).length + @get('lines').filterBy('','').length < @get('lines').length
  ).property('lines.@each', 'lines')


`export default Multiline`
