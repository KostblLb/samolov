Samolov.TaskSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  serializeIntoHash: (hash, data, type, record, options) ->
    hash['_type'] = @serialize record, options

Samolov.TextSerializer  = Samolov.TaskSerializer.extend()

Samolov.TableSerializer = Samolov.TaskSerializer.extend
  attrs:
    rows: {embedded: 'always'}
