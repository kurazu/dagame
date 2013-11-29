define ['engine/view/world', 'engine/model/world'], (WorldView, WorldModel) ->
    'use strict'

    class WorldController
        constructor: (canvas) ->
            @items = []
            @model = new WorldModel
            @view = new WorldView canvas
        addItem: (item) ->
            @items.push item
            return
        animate: (fraction) ->
            @move fraction
            @draw()
            return
        move: (fraction) ->
            world_model = @model
            items = @items

            moved = []
            unmoved = []

            for item in items
                new_position = item.animate fraction, world_model
                if not new_position
                    unmoved.push item
                else
                    moved.push [item, new_position]

            for [item, new_position] in moved
                item.model.setPosition new_position
            return
        draw: () ->
            view = @view
            view.preDraw()
            for item in @items
                view.drawItem item.view, item.model
            view.postDraw()
            return

