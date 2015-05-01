`import DS from "ember-data";` 
 
AdvertSerializer = DS.ActiveModelSerializer.extend
  serializeIntoHash: (hash, type, record, options) ->
    @_super hash, type, record, options
    Ember.merge hash, {
      'group_id': record.get('groupId')
    }

 
`export default AdvertSerializer;`
