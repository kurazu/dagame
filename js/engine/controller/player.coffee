define ['engine/controller/item', 'engine/view/box'], (ItemController, BoxView) ->
    class PlayerController extends ItemController
        view_class: BoxView
        constructor: (@keyboard, model_options, view_options) ->
            super model_options, view_options
