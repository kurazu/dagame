define [], () ->
    class BoxView
        default_options:
            lineColor: 'rgb(255, 0, 0)'
            bgColor: 'rgb(255, 255, 0)'
        draw: (ctx, model) ->
            {x, y, width, height} = model
            w_half = width / 2
            h_half = height / 2
            ctx.fillStyle = @bgColor
            ctx.translate @x, @y
            ctx.fillRect -w_half, -h_half, width, height
            ctx.strokeStyle = @lineColor
            ctx.strokeRect -w_half, -h_half, width, height
