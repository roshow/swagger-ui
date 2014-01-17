class MainView extends Backbone.View
  initialize: ->

  render: ->
    # Render the outer container for resources
    $(@el).html(Handlebars.templates.main(@model))

    # Render each resource
    @addResource resource for resource in @model.apisArray
    @

  addResource: (resource) ->
    # Render a resource and add it to resources li
    loading_img = @attributes.loading_img;
    resourceView = new ResourceView({model: resource, tagName: 'li', id: 'resource_' + resource.name, className: 'resource', attributes:{loading_img: loading_img}})
    $('#resources').append resourceView.render().el

  clear: ->
    $(@el).html ''