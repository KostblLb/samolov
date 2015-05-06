`import DS from "ember-data";` 
 
Faq = DS.Model.extend
  question: DS.attr 'string'
  answer:   DS.attr 'string'
 
`export default Faq;`
