class BackboneTest.Views.Entry extends Backbone.View

  template: JST['entries/entry']
  tagName: 'li'

  initialize: ->
    @model.on('change', @render, @)
    @model.on('highlight', @highlightWinner, @)

  highlightWinner: ->
    $('.winner').removeClass('highlight')
    @$('.winner').addClass('highlight')

  render: ->
    $(@el).html(@template(entry: @model))
    @
