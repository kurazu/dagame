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
                if new_position
                    moved.push [item, new_position]
                else
                    unmoved.push item

            for [item, new_position] in moved
                collides = false
                for fixed in unmoved
                    collides = item.checkCollision new_position, fixed
                    if collides
                        break
                if not collides
                    item.model.setPosition new_position
            return
        draw: () ->
            view = @view
            view.preDraw()
            for item in @items
                view.drawItem item.view, item.model
            view.postDraw()
            return

