# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.Scale = DS.Model.extend
  name: DS.attr 'string'

  sections: DS.hasMany 'sections'
