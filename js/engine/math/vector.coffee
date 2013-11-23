define [], () ->
    class Vector
        constructor: (@dx, @dy) ->
        toString: () ->
            "Vector(#{@dx}, #{@dy})"
