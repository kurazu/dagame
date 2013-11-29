define ['engine/controller/item', 'engine/view/box', 'engine/utils/keyboard',
        'engine/math/vector'], (ItemController, BoxView, KeyBoard, Vector) ->
    'use strict'

    LEFT_VECTOR = new Vector -1, 0
    RIGHT_VECTOR = new Vector 1, 0
    UP_VECTOR = new Vector 0, 11

    class PlayerController extends ItemController
        view_class: BoxView
        default_model_options:
            height: 2
        default_view_options:
            lineColor: 'rgb(255, 0, 0)'
            bgColor: 'rgb(0, 255, 0)'
        constructor: (@keyboard, model_options, view_options) ->
            super model_options, view_options
        animate: (fraction, world_model) ->
            pull = new Vector 0, 0
            keyboard = @keyboard
            if keyboard.isPressed KeyBoard.LEFT
                pull.add LEFT_VECTOR
            if keyboard.isPressed KeyBoard.RIGHT
                pull.add RIGHT_VECTOR
            if keyboard.isPressed KeyBoard.UP or keyboard.isPressed KeyBoard.SPACE
                pull.add new Vector 0, 1.2 * world_model.gravity
            @model.velocity.add pull
            super fraction, world_model
