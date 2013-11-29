define ['underscore', 'engine/math/vector'], (_, Vector) ->
    'use strict'

    class WorldModel
        gravity: 5
        terminalVelocity: 5
        constructor: (options) ->
            _.extend @, options
            @gravityForce = new Vector 0, -@gravity
