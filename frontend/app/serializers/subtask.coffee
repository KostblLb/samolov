`import DS from "ember-data";` 
 
SubtaskSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  serializeIntoHash: (hash, data, type, record, options) ->
    hash['_type'] = @serialize record, options

TextSerializer  = SubtaskSerializer.extend()

TableSerializer = SubtaskSerializer.extend
  attrs:
    rows: {embedded: 'always'}

PositionProfileSerializer = SubtaskSerializer.extend
  attrs:
    profileCompulsory: {embedded: 'always'}
    profileDesirable: {embedded: 'always'}

SelectSerializer = SubtaskSerializer.extend
  attrs:
    options:  {embedded: 'always'}
#    answers: {embedded: 'always'}
    answers: { serialize: 'ids',  deserialize: 'records' }


 
`export default SubtaskSerializer;`
