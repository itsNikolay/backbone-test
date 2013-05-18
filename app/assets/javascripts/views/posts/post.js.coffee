class BackboneTest.Views.Post extends Backbone.View

  template: JST['posts/post']

  events:
    'click a#back-to-posts': 'navigateBack'

  initialize: ->
    @model.bind 'change', @render, @

  render: ->
    $(@el).html(@template(post: @model))
    @

  navigateBack: (e) ->
    e.preventDefault()
    @collection = new BackboneTest.Collections.Posts()
    @collection.fetch(reset: true)
    jTable = $('#posts')
    jTable.hide "slide", { direction: "right" }, =>
      view = new BackboneTest.Views.PostsIndex(collection: @collection)
      jTable.show("slide", { direction: "left" }).html(view.render().el)
      Backbone.history.navigate("/posts")
