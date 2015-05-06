`import Ember from "ember";` 
 
 # for more details see: http://emberjs.com/guides/components/

StudentListComponent = Ember.Component.extend
  currentUnit: null
  currentGroup: null

  sortedProgresses: (->
    currentProgresses = []
    unitProgresses = @get('currentUnit.unitProgresses').content
    students = @get('currentGroup.students').content
    currentProgresses = unitProgresses.filter((item) ->
      students.indexOf(item.get('user')) != -1
    )
    currentProgresses.sortBy('points')
  ).property('currentUnit', 'currentUnit.unitProgresses', 'currentGroup')


 
 
`export default StudentListComponent;`
