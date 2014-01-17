class ResourceView extends Backbone.View
  initialize: ->

  render: ->
    console.log @model.description
    $(@el).html(Handlebars.templates.resource(@model))

    @number = 0

    # Render each operation
    @addOperation operation for operation in @model.operationsArray
    @

  addOperation: (operation) ->

    operation.number = @number

    # Render an operation and add it to operations li
    loading_img = @attributes.loading_img;
    operationView = new OperationView({model: operation, tagName: 'li', className: 'endpoint', attributes:{loading_img: loading_img}})
    $('.endpoints', $(@el)).append operationView.render().el

    @number++