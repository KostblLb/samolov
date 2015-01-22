# for more details see: http://emberjs.com/guides/controllers/

Samolov.MessagesIndexController = Ember.ArrayController.extend
  queryParams: ['scope']
  scope: 'inbox'
