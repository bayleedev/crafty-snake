Crafty.c "Borders",
  board: game.board()
  init: ->
    for pos in @board.borders()
      Crafty.e('Block').at(pos.x, pos.y)
