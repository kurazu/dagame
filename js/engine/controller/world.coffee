define ['engine/view/world', 'engine/model/world'], (WorldView, WorldModel) ->
    'use strict'

    class WorldController
        constructor: (canvas) ->
            @items = []
            @model = new WorldModel
            @view = new WorldView canvas
        addItem: (item) ->
            @items.push item
        animate: (fraction) ->
            world_model = @model
            view = @view
            items = @items

            for item in items
                item.animate fraction, world_model

            view.preDraw()
            for item in items
                view.drawItem item.view, item.model
            view.postDraw()
