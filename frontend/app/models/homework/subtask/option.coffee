`import DS from "ember-data";`

Option = DS.Model.extend
  answer: DS.attr 'string'

  isFilled: (->
    @get('answer')? && @get('answer') != ''
  ).property('answer')

`export default Option;`
