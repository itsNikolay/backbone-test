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
    Backbone.history.navigate("/posts", trigger: true);
