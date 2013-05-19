class BackboneTest.Views.Post extends Backbone.View

  template: JST['posts/post']

  events:
    'click a#back-to-posts': 'navigateBack'
    'click a#edit_post': 'editPost'

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

  editPost: (e) ->
    e.preventDefault()
    jTable = $('#posts')
    attrId = $(e.currentTarget).attr('data-id')
    @post = new BackboneTest.Models.Post(id: attrId)
    collection = new BackboneTest.Collections.Posts @post
    @post.fetch(reset: true)
    jTable.hide "slide", { direction: "left" }, =>
      view = new BackboneTest.Views.PostsEdit(model: @post, collection: collection)
      jTable.show("slide", { direction: "right" }).html(view.render().el)
      Backbone.history.navigate("/posts/#{attrId}/edit")
