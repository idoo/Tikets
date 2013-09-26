Double.Views.Tickets ||= {}

class Double.Views.Tickets.TicketView extends Backbone.View
  template: JST["backbone/templates/tickets/ticket"]

  initialize: () ->

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    param = @requestParams()
    @$el.html(@template(param))
    @

  getIds: ->
    if @options.ids
      ids = @options.ids.reduce (x, y) -> x + ';' + y
      ids += ';'
    else
      ids = ''

  requestParams: ->
    ids = @getIds()
    _.extend(@model.toJSON(), ids: ids)