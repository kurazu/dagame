define ['engine/controller/item', 'engine/view/box'], (ItemController, BoxView) ->
    'use strict'

    class ProjectileController extends ItemController
        view_class: BoxView
        default_view_options:
            bgColor: 'rgb(0, 0, 255)'
            lineColor: 'rgb(0, 0, 0)'
