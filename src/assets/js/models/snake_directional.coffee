Crafty.c "SnakeDirectional",

  UP: 1
  RIGHT: 2
  DOWN: 3
  LEFT: 4

  button_to_direction:
    K: 1
    L: 2
    J: 3
    H: 4

  init: ->
    @requires('Model, Keyboard')
    @data(
      direction: @RIGHT
      at: [1,1]
    )
    @bind 'KeyDown', @change_direction

  remove: ->
    @unbind 'KeyDown', @change_direction

  change_direction: (e) ->
    for key,value of @button_to_direction
      if e.key == Crafty.keys[key]
        return @data(direction: value)

  next_direction: ->
    at = @data('at')
    direction = @data('direction')
    if direction == @RIGHT
      at[0]++
    else if direction == @LEFT
      at[0]--
    else if direction == @UP
      at[1]--
    else if direction == @DOWN
      at[1]++
    at

  move_to_next_direction: ->
    @data(at: @next_direction())
