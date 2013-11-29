define [], () ->
    'use strict'

    class Vector
        constructor: (@x, @y) ->
        toString: () ->
            "Vector(#{@x}, #{@y})"
        scaled: (ratio) ->
            new Vector @x * ratio, @y * ratio
        scale: (ratio) ->
            @x *= ratio
            @y *= ratio
            @
        added: (other) ->
            new Vector @x + other.x, @y + other.y
        add: (other) ->
            @x += other.x
            @y += other.y
            @

