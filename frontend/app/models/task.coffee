`import DS from "ember-data";` 
 
Task = DS.Model.extend

  description: DS.attr 'string'
  order:       DS.attr 'number'
  isCorrect:   DS.attr 'boolean'
  comment:     DS.attr 'string'

  subtasks: DS.hasMany 'subtask', polymorphic: true


 
`export default Task;`
