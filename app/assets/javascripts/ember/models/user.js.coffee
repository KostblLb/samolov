# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.User = DS.Model.extend
  email:     DS.attr 'string'
  lastName:  DS.attr 'string'
  firstName: DS.attr 'string'
  avatarUrl: DS.attr 'string'
  avatar:    DS.attr 'string'

  fullName: (->
    firstName = @get('firstName') || 'No name'
    lastName  = @get('lastName')  || ''
    "#{firstName} #{lastName}"
  ).property('firstName', 'lastName')

  itsMe: (->
    @id == window.myId
  ).property('id')
