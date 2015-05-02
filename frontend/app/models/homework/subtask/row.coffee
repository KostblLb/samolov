`import DS from "ember-data";`

Row = DS.Model.extend
  cells: DS.attr()
  name: DS.attr 'string'
  colspan: DS.attr 'number'
  rowspan: DS.attr 'number'

`export default Row;`
