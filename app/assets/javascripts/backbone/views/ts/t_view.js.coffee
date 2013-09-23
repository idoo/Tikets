Double.Views.Ts ||= {}

class Double.Views.Ts.TView extends Backbone.View
  template: JST["backbone/templates/ts/t"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
