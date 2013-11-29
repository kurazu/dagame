define ['engine/controller/item', 'engine/view/box'], (ItemController, BoxView) ->
    'use strict'

    class BoxController extends ItemController
        view_class: BoxView
        animate: (fraction, world_model) ->
            null # no movement
