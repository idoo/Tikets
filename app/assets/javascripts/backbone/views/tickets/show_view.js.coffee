Double.Views.Tickets ||= {}

class Double.Views.Tickets.ShowView extends Backbone.View
  template: JST["backbone/templates/tickets/show"]

  initialize: () ->
#    @children = new Double.Collections.TicketsCollection()
#    @tickets = new Double.Collections.TicketsCollection()
#    console.log @tickets.length
#    @children = @children.findByParent(77)
#    console.log @children


  render: ->
#    children = new Double.Collections.TicketsCollection().findByParent(77)
#    console.log(children)
#
#    @$el.html(@template(@model.toJSON() ))
#
#    return this
#
#  findChildren: (ids) ->
#    console.log(parseInt ids[0], 10)
#    children = new Double.Collections.TicketsCollection()
#    console.log(children)
#    return children