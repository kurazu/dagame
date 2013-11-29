define ['engine/controller/item', 'engine/view/box'], (ItemController, BoxView) ->
    'use strict'

    class ProjectileController extends ItemController
        view_class: BoxView
