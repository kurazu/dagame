define ['engine/view/world'], (WorldView) ->
    class WorldController
        constructor: (canvas) ->
            @items = []
            @view = new WorldView canvas
        addItem: (item) ->
            @items.push item
        animate: (diff) ->
            for item in @items
                item.animate diff
            @view.preDraw()
            for item in @items
                @view.drawItem item.view, item.model
            @view.postDraw()
