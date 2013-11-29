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
        setPosition: (vector) ->
            @x = vector.x
            @y = vector.y
            return
