# for more details see: http://emberjs.com/guides/components/

Samolov.ScrollingMessagesComponent = Ember.Component.extend

  didInsertElement: ->
    $("#scrolling_messages").scrollTop($('#scrolling_messages')[0].scrollHeight);

