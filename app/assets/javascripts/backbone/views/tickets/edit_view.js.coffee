Double.Views.Tickets ||= {}

class Double.Views.Tickets.EditView extends Backbone.View
  template: JST["backbone/templates/tickets/edit"]

  events:
    "submit #edit-ticket": "update"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success: (ticket) =>
        @model = ticket
        window.location.hash = "/#{@model.id}"
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
