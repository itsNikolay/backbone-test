class BackboneTest.Views.PostsIndex extends Backbone.View

  template: JST['posts/index']

  events:
    'click a#show_post': 'showPost'
    'click a#edit_post': 'editPost'
    'click a#delete_post': 'deletePost'
    'click a#post-new': 'createPost'

  initialize: ->
    @collection.on('reset', @render, @)

  render: ->
    console.log "render"
    @$el.html @template(posts: @collection)
    @

  showPost: (e) ->
    e.preventDefault()
    jTable = $('table')
    attrId = $(e.currentTarget).attr('data-id')
    @post = new BackboneTest.Models.Post(id: attrId)
    collection = new BackboneTest.Collections.Posts @post
    @post.fetch(reset: true)
    jTable.hide "slide", { direction: "left" }, =>
      view = new BackboneTest.Views.PostsEdit(model: @post, collection: collection)
      jTable.show("slide", { direction: "right" }).html(view.render().el)
      Backbone.history.navigate("/posts/#{attrId}")

  createPost: (e) ->
    e.preventDefault()
    Backbone.history.navigate("/posts/new", trigger: true);

  deletePost: (e) ->
    e.preventDefault()
    attrId = $(e.currentTarget).attr('data-id')
    post = new BackboneTest.Models.Post(id: attrId)
    collection = new BackboneTest.Collections.Posts post
    post.destroy
      wait: true
      success: -> $(e.currentTarget).closest('tr').remove()

  editPost: (e) ->
    e.preventDefault()
    attrId = $(e.currentTarget).attr('data-id')
    Backbone.history.navigate("/posts/#{attrId}/edit", trigger: true);
