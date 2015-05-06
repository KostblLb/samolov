`import DS from "ember-data";`

Subtask = DS.Model.extend

  _type:       DS.attr 'string'
  type:        DS.attr 'string'
  description: DS.attr 'string'
  order:       DS.attr 'number'

  task: DS.belongsTo 'task'

  reviewPartialName: (->
    "#{@get 'partialName'}_review"
  ).property('partialName')

`export default Subtask`
