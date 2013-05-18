class BackboneTest.Views.PostsEdit extends Backbone.View

  template: JST['posts/edit']

  events:
    'submit form': 'edit'
    'click a#back-to-posts': 'navigateBack'

  initialize: ->
    @model.on 'change', @render, @
    @collection.on 'change', @render, @
    @model.on 'save', @navigateToPost, @

  render: ->
    $(@el).html(@template(post: @model))
    @

  edit: (event) ->
    event.preventDefault()
    @model.set
      title: $('#title-input').val()
      content: $('#content-textarea').val()
    @model.save(null, {
      wait: true
      success: =>
        @model.trigger('save')
      error: -> alert("error")
    })

  navigateBack: (e) ->
    e.preventDefault()
    @collection.fetch(reset: true)
    jTable = $('table')
    jTable.hide "slide", { direction: "left" }, =>
      view = new BackboneTest.Views.PostsIndex(collection: @collection)
      jTable.show("slide", { direction: "right" }, 1000).html(view.render().el)
      Backbone.history.navigate("/posts")

  navigateToPost: ->
    modelId = @model.get 'id'
    Backbone.history.navigate("/posts/#{modelId}", trigger: true);