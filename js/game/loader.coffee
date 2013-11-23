define ['engine/loop', 'engine/keyboard'], (Loop, Keyboard) ->
    () ->
        keyboard = new Keyboard
        keyboard.bind()

        loop_callback = (ms) ->
            #document.body.innerText = '' + ms

        game_loop = new Loop loop_callback
        game_loop.start()
