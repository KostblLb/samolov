`import DS from "ember-data";`

Task = DS.Model.extend

  description: DS.attr 'string'
  order:       DS.attr 'number'
  isCorrect:   DS.attr 'boolean'
  comment:     DS.attr 'string'

  subtasks: DS.hasMany 'subtask', polymorphic: true

  allSubtasksIsFilled: (->
    @get('subtasks').filterBy('isFilled', false).length == 0
  ).property('subtasks.@each.isFilled')

`export default Task;`
