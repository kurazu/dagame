define ['engine/view/item'], (ItemView) ->
    'use strict'

    class BoxView extends ItemView
        default_options:
            lineColor: 'rgb(0, 0, 0)'
            bgColor: 'rgb(255, 255, 0)'
        draw: (ctx, model) ->
            {x, y, half_width, width, half_height, height} = model
            ctx.translate x, y
            ctx.fillStyle = @bgColor
            ctx.fillRect -half_width, -half_height, width, height
            ctx.strokeStyle = @lineColor
            ctx.strokeRect -half_width, -half_height, width, height
