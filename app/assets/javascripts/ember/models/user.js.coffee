# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.User = DS.Model.extend
  email:     DS.attr 'string'
  lastName:  DS.attr 'string'
  firstName: DS.attr 'string'
  avatarUrl: DS.attr 'string'
  smallAvatarUrl: DS.attr 'string'
  avatar:    DS.attr 'string'
  isTeacher: DS.attr 'boolean'
  birthday:  DS.attr 'date'
  city:      DS.attr 'string'
  country:   DS.attr 'string'
  phone:     DS.attr 'string'
  skype:     DS.attr 'string'
  companyName: DS.attr 'string'
  jobTitle:  DS.attr 'string'
  vkLink:    DS.attr 'string'
  fbLink:    DS.attr 'string'
  gplusLink: DS.attr 'string'
  lnLink:    DS.attr 'string'
  twLink:    DS.attr 'string'
  unreads_messages_count: DS.attr 'number'

  friends:   DS.hasMany 'user'

  subscribtion: DS.belongsTo 'subscribtion'
  fullName: (->
    firstName = @get('firstName') || 'No name'
    lastName  = @get('lastName')  || ''
    "#{firstName} #{lastName}"
  ).property('firstName', 'lastName')

  itsMe: (->
    @id == window.myId
  ).property('id')

  hasUnread: (->
    @get('unreads_messages_count') > 0
  ).property('unreads_messages_count')

  previewEmail: (->
    if @get('email') != null && @get('email').length > 20
      return @get('email').substring(0,20) + '...'
    else
      return @get('email')
  ).property('email')

