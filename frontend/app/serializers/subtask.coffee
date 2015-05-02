`import DS from "ember-data";`

SubtaskSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  serializeIntoHash: (hash, data, type, record, options) ->
    hash['_type'] = @serialize record, options

`export default SubtaskSerializer;`
