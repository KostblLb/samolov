Samolov.QuizProgressController = Ember.ObjectController.extend

  actions:
    backToUnit:->
      if @model.get('isQuiz')
        @transitionToRoute('unit', @model.get('unitId'),{queryParams: {scope: 'summary'}})
      else
        @transitionToRoute('unit', @model.get('unitId'),{queryParams: {scope: 'webinar'}})