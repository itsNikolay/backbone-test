class BackboneTest.Views.PostsIndex extends Backbone.View

  template: JST['posts/index']

  events:
    'click a#show_post': 'showPost'
    'click a#post-new': 'createPost'

  initialize: ->
    @collection.on('reset', @render, @)

  render: ->
    @$el.html @template(posts: @collection)
    @

  showPost: (e) ->
    e.preventDefault()
    attrId = $(e.currentTarget).attr('data-id')
    Backbone.history.navigate("/posts/#{attrId}", trigger: true);

  createPost: (e) ->
    e.preventDefault()
    Backbone.history.navigate("/posts/new", trigger: true);
