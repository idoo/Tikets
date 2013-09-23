class Double.Routers.TsRouter extends Backbone.Router
  initialize: (options) ->
    @ts = new Double.Collections.TsCollection()
    @ts.reset options.ts

  routes:
    "new"      : "newT"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newT: ->
    @view = new Double.Views.Ts.NewView(collection: @ts)
    $("#ts").html(@view.render().el)

  index: ->
    @view = new Double.Views.Ts.IndexView(ts: @ts)
    $("#ts").html(@view.render().el)

  show: (id) ->
    t = @ts.get(id)

    @view = new Double.Views.Ts.ShowView(model: t)
    $("#ts").html(@view.render().el)

  edit: (id) ->
    t = @ts.get(id)

    @view = new Double.Views.Ts.EditView(model: t)
    $("#ts").html(@view.render().el)
