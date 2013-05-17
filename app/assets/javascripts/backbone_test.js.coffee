window.BackboneTest =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new BackboneTest.Routers.Entries()
    new BackboneTest.Routers.Posts()

    Backbone.history.start(pushState: true)

$(document).ready ->
  BackboneTest.initialize()
