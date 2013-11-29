define ['underscore', 'backbone'], (_, Backbone) ->
    'use strict'

    class Events
    _.extend Events::, Backbone.Events
    return Events
