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
            dv = @applyGravity fraction, world_model
            v = @model.velocity.added dv
            @model.add v
        applyGravity: (fraction, world_model) ->
            world_model.gravityForce.scaled fraction

