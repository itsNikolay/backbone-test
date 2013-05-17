class BackboneTest.Views.PostsNew extends Backbone.View

  template: JST['posts/new']

  events:
    'submit form': 'create'
    'click a#back-to-posts': 'navigateBack'

  render: ->
    $(@el).html(@template(post: @model))
    @

  create: (event) ->
    event.preventDefault()
    @collection.create
      title: $('#title-input').val()
      content: $('#content-textarea').val()

  navigateBack: (e) ->
    e.preventDefault()
    Backbone.history.navigate("/posts", trigger: true);
