`import DS from "ember-data";` 
 
Subscribtion = DS.Model.extend

  newMessage:  DS.attr 'boolean'
  newAdvert:   DS.attr 'boolean'
  newEvent:    DS.attr 'boolean'
  moduleStart: DS.attr 'boolean'

 
`export default Subscribtion;`
