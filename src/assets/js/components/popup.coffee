# Generic for food/blocks
# Generates a "popup" and places it randomly on the map
Crafty.c "Popup",
  popups: []
  component: 'Food'
  board: null

  init: ->
    @board = game.board()

  # Delete old popup(s)
  delete: ->
    for popup in popups
      popup.destroy()

  # Creates a popup at a given location
  create: (x, y) ->
    Crafty.c(@component).at(x,y)

  # Picks an empty spot on the board
  pick_location: ->
    while (true)
      x = Crafty.math.randomInt(0, @board.grid_width())
      y = Crafty.math.randomInt(0, @board.grid_height())
      return {x: x,y: y} unless game.taken(x, y)

  # Creates the new popup!
  popup: ->
    delete()
    create.apply(@, pick_location())
