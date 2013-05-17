class BackboneTest.Routers.Posts extends Backbone.Router
  routes:
    'posts': 'index'
    'posts/:id': 'show'

  initialize: ->
    @collection = new BackboneTest.Collections.Posts()

  index: ->
    @collection.fetch(reset: true)
    view = new BackboneTest.Views.PostsIndex(collection: @collection)
    $('ul#posts').html(view.render().el)

  show: (id) ->
    post = new BackboneTest.Models.Post(id: id)
    view = new BackboneTest.Views.Post(model: post)
    collection = new BackboneTest.Collections.Posts post
    post.fetch(reset: true)

    $('ul#posts').html(view.render().el)
