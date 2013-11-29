define ['underscore', 'engine/model/item', 'engine/view/item'], (_, ItemModel, ItemView) ->
    'use strict'

    class ItemController
        model_class: ItemModel
        view_class: ItemView
        default_model_options: {}
        default_view_options: {}
        constructor: (model_options, view_options) ->
            model_options = _.extend {}, @default_model_options, model_options
            view_options = _.extend {}, @default_view_options, view_options
            @model = new @model_class model_options
            @view = new @view_class view_options
        animate: (fraction, world_model) ->
            gravity = world_model.gravityForce
            @model.velocity.add gravity
            @model.velocity.cap world_model.terminal_speed
            new_position = @model.added @model.velocity.scaled fraction
            new_position
        checkCollision: (new_position, other) ->
            actual_x_diff = Math.abs(new_position.x - other.model.x)
            expected_x_diff = @model.half_width + other.model.half_width
            x_diff = expected_x_diff - actual_x_diff
            if x_diff <= 0
                return false

            actual_y_diff = Math.abs(new_position.y - other.model.y)
            expected_y_diff = @model.half_height + other.model.half_height
            y_diff = expected_y_diff - actual_y_diff
            if y_diff <= 0
                return false

            if y_diff < x_diff
                new_position.y += y_diff * (if new_position.y > other.model.y then 1 else -1)
                @model.velocity.y = 0
            else
                new_position.x += x_diff * (if new_position.x > other.model.x then 1 else -1)
                @model.velocity.x = 0

            return false
            # this_bounds = @model.getBounds new_position
            # other_bounds = other.model.getBounds()

            # if other_bounds.bottom < this_bounds.bottom < other_bounds.top
            #     return true
            # else if other_bounds.bottom < this_bounds.top < other_bounds.top
            #     return true
            # else
            #     return false
