define ['engine/model/world', 'engine/view/world'], (WorldModel, WorldView) ->
    class WorldController
        constructor: (canvas) ->
            @model = new WorldModel
            @view = new WorldView canvas
        animate: (diff) ->
            @applyGravitation diff
            @applyMovement diff
            @view.draw @model
        applyGravitation: (diff) ->
            t = diff / 1000
            t2 = t * t
            for item_model in @model.items
                v = item_model.v
                dvy = @model.gravity * t2
                v.dy -= dvy
            return
        applyMovement: (diff) ->
            for item_model in @model.items
                item_model.x += item_model.v.dx
                item_model.y += item_model.v.dy
            return
