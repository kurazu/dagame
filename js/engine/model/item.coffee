define ['underscore', 'engine/utils/events', 'engine/math/vector'], (_, Events, Vector) ->
    class Item extends Events
        terminal_speed: 100
        x: 0,
        y: 0,
        width: 1
        height: 1
        mass: 1
        constructor: (props) ->
            @v = new Vector 0, 0
            _.extend @, props
        applyMomentum: (pVector) ->
            pVector = pVector.scale 1 / @mass
            @v.add pVector
