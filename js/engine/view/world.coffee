define [], () ->
    class WorldView
        pixel_per_meter: 25
        camera: null
        constructor: (@canvas) ->
            @width = canvas.width
            @height = canvas.height
            ctx = @ctx = canvas.getContext '2d'
            ctx.translate 0, @height
            ctx.scale 1, -1
            ctx.save()
        preDraw: () ->
            ctx = @ctx
            ctx.save()
            ctx.clearRect 0, 0, @width, @height
            ctx.scale @pixel_per_meter, @pixel_per_meter
            ctx.lineWidth = 1 / @pixel_per_meter
        drawItem: (view, model) ->
            ctx = @ctx
            ctx.save()
            view.draw ctx, model
            ctx.restore()
        postDraw: () ->
            @ctx.restore()
        setCamera: (@camera) ->

