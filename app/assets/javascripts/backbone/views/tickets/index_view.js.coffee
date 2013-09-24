Double.Views.Tickets ||= {}

class Double.Views.Tickets.IndexView extends Backbone.View
  template: JST["backbone/templates/tickets/index"]

  initialize: () ->
    @options.tickets.bind('reset', @addAll)

  events:
    "submit #filter" : "filter"

  filter: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @param = $('#key').val()
    @list = @options.tickets.byCarrier(@param)

    if @fil is "" then @render() else @renderFilter()
    return

  addAll: () =>
    @options.tickets.each(@addOne)

  addOne: (ticket) =>
    view = new Double.Views.Tickets.TicketView({model : ticket})
    @$("tbody").append(view.render().el)

  renderFilter: ->
    $(@el).html(@template(tickets: @options.tickets.toJSON() ))
    $("#key").val(@param)
    @addOne model for model in @list
    @

  render: =>
    @$el.html(@template(tickets: @options.tickets.toJSON() ))
    @addAll()

    return this
