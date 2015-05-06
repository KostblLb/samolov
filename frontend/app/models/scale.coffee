`import DS from "ember-data";`

Scale = DS.Model.extend
  name: DS.attr 'string'

  sections: DS.hasMany 'sections'


`export default Scale;`
