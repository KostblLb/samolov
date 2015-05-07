`import DS from "ember-data";`

Row = DS.Model.extend
  cells: DS.attr()
  name: DS.attr 'string'
  colspan: DS.attr 'number'
  rowspan: DS.attr 'number'

  isFilled: (->
    @get('cells').filterBy('',null).length + @get('cells').filterBy('','').length < @get('cells').length
  ).property('cells')
`export default Row;`
