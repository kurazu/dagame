define [], () ->
    class Loop
        min_diff: 10
        max_diff: 100
        constructor: (@callback) ->
            @frame = @frame.bind @
        start: () ->
            @ts = +new Date
            window.requestAnimationFrame @frame
        frame: () ->
            diff = +new Date - @ts
            if diff < @min_diff
                diff = @min_diff
            else if diff > @max_diff
                diff = @max_diff

            @callback diff

            @ts = +new Date
            window.requestAnimationFrame @frame
