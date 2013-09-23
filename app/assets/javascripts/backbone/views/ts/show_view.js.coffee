Double.Views.Ts ||= {}

class Double.Views.Ts.ShowView extends Backbone.View
  template: JST["backbone/templates/ts/show"]

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
