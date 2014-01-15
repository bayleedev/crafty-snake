Crafty.c "Directional",

  UP: 0
  RIGHT: 1
  DOWN: 2
  LEFT: 3

  button_to_direction:
    UP_ARROW: @UP
    DOWN_ARROW: @DOWN
    RIGHT_ARROW: @RIGHT
    LEFT_ARROW: @LEFT

  init: ->
    @requires('Model')
    @data(
      direction: @RIGHT
      at: [1,1]
    )

  bind_key_events: ->
    @bind 'KeyDown', ->
      for key, value of Crafty.keys
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
    @data(at: next_direction)
