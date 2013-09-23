class Double.Models.T extends Backbone.Model
  paramRoot: 't'

  defaults:
    carrier: null
    price: null
    departure: null
    arrival: null

class Double.Collections.TsCollection extends Backbone.Collection
  model: Double.Models.T
  url: '/ts'
