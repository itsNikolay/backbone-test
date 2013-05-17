class BackboneTest.Routers.Entries extends Backbone.Router
  routes:
    '': 'index'
    'entries/:id': 'show'

  initialize: ->
    @collection = new BackboneTest.Collections.Entries()
    @collection.reset($('#container').data('entries'))

  index: ->
    view = new BackboneTest.Views.EntriesIndex(collection: @collection)
    $('#container').html(view.render().el)

  show: (id) ->
    alert "entry #{id}"
