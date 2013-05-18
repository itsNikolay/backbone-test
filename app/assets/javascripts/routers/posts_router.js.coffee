class BackboneTest.Routers.Posts extends Backbone.Router
  routes:
    'posts': 'index'
    'posts/new': 'new'
    'posts/:id': 'show'
    'posts/:id/delete': 'delete'
    'posts/:id/edit': 'edit'

  initialize: ->
    @collection = new BackboneTest.Collections.Posts()


  index: ->
    @collection.fetch(reset: true)
    view = new BackboneTest.Views.PostsIndex(collection: @collection)
    $('#posts').html(view.render().el)

  show: (id) ->
    post = new BackboneTest.Models.Post(id: id)
    view = new BackboneTest.Views.Post(model: post)
    collection = new BackboneTest.Collections.Posts post
    post.fetch(reset: true)
    $('#posts').html(view.render().el)

  new: ->
    post = new BackboneTest.Models.Post
#    posts = new BackboneTest.Collections.Posts
    @collection.bind 'add', =>
      @navigate '/posts', true
    view = new BackboneTest.Views.PostsNew
      collection: @collection
      model: post
    $('#posts').html(view.render().el)

  delete: (id) ->
    post = new BackboneTest.Models.Post(id: id)
    collection = new BackboneTest.Collections.Posts post
    post.fetch(reset: true)
    post.destroy
      success: -> Backbone.history.navigate("/posts", trigger: true);

  edit: (id) ->
    @post = new BackboneTest.Models.Post(id: id)
    collection = new BackboneTest.Collections.Posts @post
    @post.fetch(reset: true)
    view = new BackboneTest.Views.PostsEdit(model: @post, collection: collection)
    $('#posts').html(view.render().el)
    @post.bind 'saved', =>
      @navigate '/posts', true
