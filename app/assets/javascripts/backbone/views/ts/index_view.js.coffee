Double.Views.Ts ||= {}

class Double.Views.Ts.IndexView extends Backbone.View
  template: JST["backbone/templates/ts/index"]

  initialize: () ->
    @options.ts.bind('reset', @addAll)

  addAll: () =>
    @options.ts.each(@addOne)

  addOne: (t) =>
    view = new Double.Views.Ts.TView({model : t})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(ts: @options.ts.toJSON() ))
    @addAll()

    return this
