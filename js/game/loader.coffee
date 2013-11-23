define ['engine/loop'], (loop_lib) ->
    () ->
        loop_callback = (ms) ->
            document.body.innerText = '' + ms

        game_loop = new loop_lib.Loop loop_callback
        game_loop.start()
