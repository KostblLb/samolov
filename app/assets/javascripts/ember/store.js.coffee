# Adds X-CSRF-Token to all REST requests.
# Allows for the use of Rails protect_from_forgery
# The CSRF Token is normally found in app/views/layouts/application.html.*
# inserted with the rails helper: "csrf_meta_tags"
#DS.RESTAdapter.reopen(
#  headers:
#    "X-CSRF-Token": $('meta[name="csrf-token"]').attr('content')
#)
Samolov.Store = DS.Store.extend
  adapter: '-active-model'
  push: (type, data, _partial) ->
    oldType = type
    dataType = data.type
    modelType = oldType
    if dataType and (@modelFor(oldType) != @modelFor(dataType))
      modelType = dataType
      if oldRecord = @getById(oldType, data.id) #get rid of the empty supertype
        @dematerializeRecord(oldRecord)
    @_super @modelFor(modelType), data, _partial