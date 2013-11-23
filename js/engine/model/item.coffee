define ['underscore', 'engine/math/vector'], (_, Vector) ->
    class Item
        terminal_speed: 100
        x: 0,
        y: 0,
        width: 1
        height: 1
        mass: 1
        constructor: (props) ->
            @v = new Vector 0, 0
            _.extend @, props
