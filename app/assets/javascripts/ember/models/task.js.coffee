Samolov.TaskAdapter = Samolov.ApplicationAdapter.extend
  pathForType: (type) ->
    'tasks'

Samolov.Task = DS.Model.extend

  _type: DS.attr 'string'
  type: DS.attr 'string'
  description: DS.attr 'string'
  order: DS.attr 'number'
  is_verified: DS.attr 'boolean'
