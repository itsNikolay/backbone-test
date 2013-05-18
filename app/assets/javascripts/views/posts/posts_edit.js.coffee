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
    console.log @model.get 'title'
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
        console.log "saved"
        @model.trigger('save')
      error: -> alert("error")
    })

  navigateBack: (e) ->
    Backbone.history.navigate("/posts", trigger: true);

  navigateToPost: ->
    modelId = @model.get 'id'
    Backbone.history.navigate("/posts/#{modelId}", trigger: true);