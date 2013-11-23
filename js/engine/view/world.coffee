define [], () ->
    class WorldView
        pixel_per_meter: 5
        constructor: (@canvas) ->
            @width = canvas.width
            @height = canvas.height
            ctx = @ctx = canvas.getContext '2d'
            ctx.translate 0, @height
            ctx.scale 1, -1
            ratio = @pixel_per_meter
            ctx.scale ratio, ratio
        draw: (model) ->
            ctx = @ctx
            ctx.clearRect 0, 0, @width, @height
            ctx.save()

            ctx.fillStyle = 'rgb(255, 0, 0)'
            for item_model in model.items
                ctx.save()
                ctx.translate item_model.x, item_model.y
                ctx.fillRect -item_model.width / 2, -item_model.height / 2, item_model.width, item_model.height
                ctx.restore()

            ctx.restore()

