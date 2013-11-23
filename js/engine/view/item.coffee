define [], () ->
    class ItemView
        constructor: () ->
        draw: (ctx, model) ->
            {x, y} = model
