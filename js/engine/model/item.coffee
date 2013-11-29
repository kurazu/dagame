define ['underscore', 'engine/math/vector'], (_, Vector) ->
    'use strict'

    class ItemModel extends Vector
        default_options:
            x: 0
            y: 0
            width: 1
            height: 1
            velocity: new Vector 0, 0
        constructor: (options) ->
            _.extend @, @default_options, options
            @half_width = @width / 2
            @half_height = @height / 2
        setPosition: (vector) ->
            @x = vector.x
            @y = vector.y
            return
        getBounds: (position) ->
            position = position || @

            left: position.x - @half_width
            right: position.x + @half_width
            top: position.y - @half_height
            bottom: position.y + @half_height
