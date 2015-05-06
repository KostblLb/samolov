`import DS from "ember-data";` 
 
# for more details see: http://emberjs.com/guides/models/defining-models/

Advert = DS.Model.extend
  title: DS.attr 'string'
  text: DS.attr 'string'
  groupId: DS.attr 'string', serialize: false


 
`export default Advert;`
