Samolov.SubtaskSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  serializeIntoHash: (hash, data, type, record, options) ->
    hash['_type'] = @serialize record, options

Samolov.TextSerializer  = Samolov.SubtaskSerializer.extend()

Samolov.TableSerializer = Samolov.SubtaskSerializer.extend
  attrs:
    rows: {embedded: 'always'}

