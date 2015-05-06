`import Ember from "ember";` 
 
  # for more details see: http://emberjs.com/guides/controllers/

GroupsShowController = Ember.ObjectController.extend
  actions:
    update: ->
      @model.save()



 
 `export default GroupsShowController;`
