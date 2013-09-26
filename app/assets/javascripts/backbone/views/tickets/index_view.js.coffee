Double.Views.Tickets ||= {}

class Double.Views.Tickets.IndexView extends Backbone.View
  template: JST["backbone/templates/tickets/index"]

  initialize: () ->
    @options.tickets.bind('reset', @addAll)

  events:
    "submit #filter" : "filter",
#    'transition:complete': 'renderFirst'

  filter: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @param = $('#key').val()
    @list = @options.tickets.byCarrier(@param)

    if @param is "" then @render() else @renderFilter()
    return

  addAll: () =>
    @options.tickets.each(@addOne)

  addOne: (ticket) =>
    view = new Double.Views.Tickets.TicketView({model : ticket})
    @$("tbody").append(view.render().el)

  renderFirst: ->
    @list = @options.tickets.onlyFirstLevel()
    $(@el).html(@template(tickets: @options.tickets.toJSON() ))
    @addOne model for model in @list
    @

  renderFilter: ->
    $(@el).html(@template(tickets: @options.tickets.toJSON() ))
    $("#key").val(@param)
    @addOne model for model in @list
    @

  render: =>
    @$el.html(@template(tickets: @options.tickets.toJSON() ))
    @addAll()

    return this
