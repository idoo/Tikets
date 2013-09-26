Double.Views.Tickets ||= {}

class Double.Views.Tickets.StepView extends Backbone.View
  template: JST["backbone/templates/tickets/show"]

  initialize: () ->
    console.log("ids is " + @options.ids)
    console.log("Parent collection " + @options.tickets)

    @last = _.last(@options.ids)
    console.log("Collection lenght: " + @last)
    @children = @findChildren(@options.ids)

  render: ->
    $(@el).html(@template(tickets: @options.tickets.toJSON() ))
    @addOne model for model in @children
    @

  addOne: (ticket) =>
    view = new Double.Views.Tickets.TicketView({
      model : ticket,
      ids : @options.ids
    })
    @$("tbody").append(view.render().el)

  findChildren: ->
    val = parseInt @last, 10
    @options.tickets.findByParent(val)