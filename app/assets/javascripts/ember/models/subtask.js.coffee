Samolov.SubtaskAdapter = Samolov.ApplicationAdapter.extend
  pathForType: (type) ->
    'subtasks'

Samolov.Subtask = DS.Model.extend

  _type:       DS.attr 'string'
  type:        DS.attr 'string'
  description: DS.attr 'string'
  order:       DS.attr 'number'
  isComplete:  DS.attr 'boolean'

  task: DS.belongsTo 'task'

  reviewPartialName: (->
    "#{@get 'partialName'}_review"
  ).property('partialName')