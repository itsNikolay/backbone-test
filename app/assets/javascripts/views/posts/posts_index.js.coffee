class BackboneTest.Views.PostsIndex extends Backbone.View

  template: JST['posts/index']

  events:
    'click a#show_post': 'showPost'

  initialize: ->
    @collection.on('reset', @render, @)

  render: ->
    @$el.html @template(posts: @collection)
    @

  showPost: (e) ->
    e.preventDefault()
    attrId = $(e.currentTarget).attr('data-id')
    Backbone.history.navigate("/posts/#{attrId}", trigger: true);
