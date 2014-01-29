Crafty.c "Board",
  init: ->
    @requires('Model')

  map_grid:
    width: 40
    height: 40
    tile:
      width: 16
      height: 16

  grid_width: ->
    @map_grid.width

  grid_height: ->
    @map_grid.width

  width: ->
    @map_grid.width * @map_grid.tile.width

  height: ->
    @map_grid.height * @map_grid.tile.height

  last_bottom_block: ->
    @map_grid.height - 1

  last_right_block: ->
    @map_grid.width - 1

  grid_width: ->
    @map_grid.tile.width

  grid_height: ->
    @map_grid.tile.width

  # Return all items at a given coords
  at: (x, y, type = 'Solid Grid') ->
    results = []
    for id in Crafty(type)
      item = Crafty(id)
      at = item.at()
      results.push(item) if at.x is x and at.y is y
    results

  taken: (x, y, type = 'Solid Grid') ->
    @at(x, y, type).length > 0

  borders: ->
    results = []
    for x in [0..@last_right_block()]
      for y in [0..@last_bottom_block()]
        top_border = y == 0
        bottom_border = y == @last_bottom_block()
        right_border = x == @last_right_block()
        left_border = x == 0
        if top_border or bottom_border or right_border or left_border
          results.push(x: x, y: y)
    results
