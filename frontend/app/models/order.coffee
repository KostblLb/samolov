`import DS from "ember-data";`

Order = DS.Model.extend
  course: DS.belongsTo 'course'


`export default Order;`
