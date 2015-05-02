`import DS from "ember-data";`

HasManyIdsSerializer = DS.ActiveModelSerializer.extend
  serializeHasMany: (record, json, relationship) ->
    key = relationship.key
    jsonKey = Ember.String.singularize(key) + '_ids'
    json[jsonKey] = Ember.get(record, key).mapBy('id')

`export default HasManyIdsSerializer;`
