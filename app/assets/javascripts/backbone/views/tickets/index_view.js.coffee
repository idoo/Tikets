Double.Views.Tickets ||= {}

class Double.Views.Tickets.IndexView extends Backbone.View
  template: JST["backbone/templates/tickets/index"]

  initialize: () ->
    @options.tickets.bind('reset', @addAll)

  addAll: () =>
    @options.tickets.each(@addOne)

  addOne: (ticket) =>
    view = new Double.Views.Tickets.TicketView({model : ticket})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(tickets: @options.tickets.toJSON() ))
    @addAll()

    return this
