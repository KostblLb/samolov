Samolov.TaskAdapter = Samolov.ApplicationAdapter.extend
  pathForType: (type) ->
    'tasks'

Samolov.Task = DS.Model.extend

  _type:       DS.attr 'string'
  type:        DS.attr 'string'
  description: DS.attr 'string'
  order:       DS.attr 'number'
  isComplete:  DS.attr 'boolean'
  isCorrect:   DS.attr 'boolean'
  comment:     DS.attr 'string'

  partialName: 'task'


  reviewPartialName: (->
    "#{@get 'partialName'}_review"
  ).property('partialName')