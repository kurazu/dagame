define ['engine/controller/item', 'engine/view/box'], (ItemController, BoxView) ->
    'use strict'

    class PlayerController extends ItemController
        view_class: BoxView
        default_model_options:
            height: 2
        default_view_options:
            lineColor: 'rgb(255, 0, 0)'
            bgColor: 'rgb(0, 255, 0)'
        constructor: (@keyboard, model_options, view_options) ->
            super model_options, view_options
