class BackboneTest.Routers.Posts extends Backbone.Router
  routes:
    'posts': 'index'
    'posts/new': 'new'
    'posts/:id': 'show'

  index: ->
    @collection = new BackboneTest.Collections.Posts()
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
    posts = new BackboneTest.Collections.Posts
    posts.bind 'add', =>
      triggerRouter = true
      @navigate '/posts', triggerRouter
    view = new BackboneTest.Views.PostsNew
      collection: posts
      model: post
    $('#posts').html(view.render().el)
