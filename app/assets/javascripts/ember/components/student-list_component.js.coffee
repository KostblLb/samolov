# for more details see: http://emberjs.com/guides/components/

Samolov.StudentListComponent = Ember.Component.extend
  currentUnit: null
  currentGroup: null

  sortedProgresses: (->
    currentProgresses = []
    unitProgresses = @get('currentUnit.unitProgresses')
    students = @get('currentGroup.students').content
    currentProgresses = unitProgresses.filter((item) ->
      students.indexOf(item.get('user').content) != -1
    )
  ).property('currentUnit','currentGroup')

