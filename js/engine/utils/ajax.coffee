define [], () ->
    'use strict'
    ajax =
        get: (url, callback) ->
            req = new XMLHttpRequest
            req.onload = () ->
                callback @responseText
            req.open "get", url
            req.send()
            req
        getJSON: (url, callback) ->
            ajax.get url, (responseText) ->
                json = JSON.parse responseText
                callback json
