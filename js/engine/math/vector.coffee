define [], () ->
    class Vector
        constructor: (@dx, @dy) ->
        toString: () ->
            "Vector(#{@dx}, #{@dy})"
        scale: (ratio) ->
            new Vector @dx * ratio, @dy * ratio
        add: (other) ->
            @dx += other.dx
            @dy += other.dy
            @
