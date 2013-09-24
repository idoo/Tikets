class Double.Models.Ticket extends Backbone.Model
  paramRoot: 'ticket'

  defaults:
    carrier: null
    price: null
    departure: null
    arrival: null



class Double.Collections.TicketsCollection extends Backbone.Collection
  model: Double.Models.Ticket
  url: '/tickets'

  byCarrier: (param) ->
    @.where(carrier: param)