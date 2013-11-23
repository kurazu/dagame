define [], () ->
    class Screen
        constructor: (@canvas) ->
            @width = canvas.width
            @height = canvas.height
            @ctx = canvas.getContext '2d'
