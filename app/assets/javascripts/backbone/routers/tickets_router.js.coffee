class Double.Routers.TicketsRouter extends Backbone.Router
  initialize: (options) ->
    @tickets = new Double.Collections.TicketsCollection()
    @tickets.reset options.tickets

  routes:
    "new"             : "newTicket"
    "index"           : "index"
    ":id/edit"        : "edit"
    ":id"             : "show"
    ":ids"            : "show"
    ".*"              : "index"

  newTicket: ->
    @view = new Double.Views.Tickets.NewView(collection: @tickets)
    $("#tickets").html(@view.render().el)

  index: ->
    @view = new Double.Views.Tickets.IndexView(tickets: @tickets)
    $("#tickets").html(@view.render().el)

  show: (ids) ->
    (ids) -> ids.split('ids')
    console.log ids[0]

    ticket = @tickets.get(ids[0])

    @view = new Double.Views.Tickets.ShowView(model: ticket)
    $("#tickets").html(@view.render().el)

  edit: (id) ->
    ticket = @tickets.get(id)

    @view = new Double.Views.Tickets.EditView(model: ticket)
    $("#tickets").html(@view.render().el)
