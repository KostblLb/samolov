`import DS from "ember-data";` 
 
# for more details see: http://emberjs.com/guides/models/defining-models/

Answer = DS.Model.extend
  text: DS.attr 'string'
  isCorrect: DS.attr 'boolean'

 
`export default Answer;`
