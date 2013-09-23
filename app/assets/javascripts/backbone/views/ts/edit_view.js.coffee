Double.Views.Ts ||= {}

class Double.Views.Ts.EditView extends Backbone.View
  template: JST["backbone/templates/ts/edit"]

  events:
    "submit #edit-t": "update"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success: (t) =>
        @model = t
        window.location.hash = "/#{@model.id}"
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
