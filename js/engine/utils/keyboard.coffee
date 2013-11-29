define [], () ->
    'use strict'

    class KeyBoard
        constructor: () ->
            @keys = {}
            @onKeyUp = @onKeyUp.bind @
            @onKeyDown = @onKeyDown.bind @
        bind: () ->
            window.addEventListener 'keydown', @onKeyDown, false
            window.addEventListener 'keyup', @onKeyUp, false
        onKeyUp: (evt) ->
            delete @keys[evt.keyCode]
        onKeyDown: (evt) ->
            @keys[evt.keyCode] = true
        isPressed: (keyCode) ->
            @keys[keyCode]

    KeyBoard.LEFT = 37
    KeyBoard.RIGHT = 39
    KeyBoard.UP = 38
    KeyBoard.DOWN = 40
    KeyBoard.SPACE = 32
    KeyBoard.ENTER = 13

    return KeyBoard
