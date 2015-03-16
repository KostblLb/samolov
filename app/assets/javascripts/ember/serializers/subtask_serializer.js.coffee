Samolov.SubtaskSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  serializeIntoHash: (hash, data, type, record, options) ->
    hash['_type'] = @serialize record, options

Samolov.TextSerializer  = Samolov.SubtaskSerializer.extend()

Samolov.TableSerializer = Samolov.SubtaskSerializer.extend
  attrs:
    rows: {embedded: 'always'}

Samolov.PositionProfileSerializer = Samolov.SubtaskSerializer.extend
  attrs:
    profileCompulsory: {embedded: 'always'}
    profileDesirable: {embedded: 'always'}

Samolov.SelectSerializer = Samolov.SubtaskSerializer.extend
  attrs:
    options:  {embedded: 'always'}
#    answers: {embedded: 'always'}
    answers: { serialize: 'ids',  deserialize: 'records' }

