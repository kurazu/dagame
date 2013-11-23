define ['underscore', 'backbone'], (_, Backbone) ->
    class Events
    _.extend Events::, Backbone.Events
    Events
