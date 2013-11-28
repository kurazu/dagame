define ['engine/model/item', 'engine/view/item'], (ItemModel, ItemView) ->
    class ItemController
        model_class: ItemModel
        view_class: ItemView
        constructor: (model_options, view_options) ->
            @model = new @model_class model_options
            @view = new @view_class view_options
        animate: (diff) ->

