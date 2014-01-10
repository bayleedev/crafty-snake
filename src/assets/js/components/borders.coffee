Crafty.c "Borders",
  init: ->
    for x in [0..window.Game.last_right_block()]
      for y in [0..window.Game.last_bottom_block()]
        top_border = y == 0
        bottom_border = y == window.Game.last_bottom_block()
        right_border = x == window.Game.last_right_block()
        left_border = x == 0
        if top_border or bottom_border or right_border or left_border
          Crafty.e('Block').at(x, y)
