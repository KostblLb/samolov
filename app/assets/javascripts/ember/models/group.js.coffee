# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.Group = DS.Model.extend
  name: DS.attr 'string'

  teacher: DS.belongsTo 'user', async: true
  course:  DS.belongsTo 'course'
  scale:   DS.belongsTo 'scale'

  students:         DS.hasMany 'user', async: true
  adverts:          DS.hasMany 'advert'
  courseProgresses: DS.hasMany 'course_progress', async: true


  canICreateAdvert: (->
    return false unless @get('teacher').content?
    @get('teacher').content.id == window.myId
  ).property('teacher')

  sortedCourseProgresses: (->
    @get('courseProgresses').sortBy('points').reverse()
  ).property('courseProgresses.@each.points')