`import Ember from "ember";`

 # for more details see: http://emberjs.com/guides/components/

StudentListComponent = Ember.Component.extend
  currentUnit: null
  currentGroup: null

  sortedProgresses: (->
    currentProgresses = []
    unitProgresses = @get('currentGroup.unitProgresses').content
    currentProgresses = unitProgresses.filter (item) =>
      item.get('unit.id') == @get('currentUnit.id')
    currentProgresses.sortBy('points')
  ).property('currentUnit', 'currentGroup.unitProgresses.content', 'currentGroup')




`export default StudentListComponent;`
