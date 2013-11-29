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
            gravity = world_model.gravityForce.scaled fraction
            velocity = @model.velocity.added gravity
            new_position = @model.added velocity
            new_position
        checkCollision: (new_position, other) ->
            if Math.abs(new_position.x - other.model.x) >= @model.half_width + other.model.half_width
                return false

            if Math.abs(new_position.y - other.model.y) >= @model.half_height + other.model.half_height
                return false

            return true
            # this_bounds = @model.getBounds new_position
            # other_bounds = other.model.getBounds()

            # if other_bounds.bottom < this_bounds.bottom < other_bounds.top
            #     return true
            # else if other_bounds.bottom < this_bounds.top < other_bounds.top
            #     return true
            # else
            #     return false
