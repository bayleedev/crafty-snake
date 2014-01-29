Crafty.scene "Game", ->

  Crafty.e("Borders")

  snake = Crafty.e("Snake")

  snake.one 'Die', ->
    Crafty.scene 'GameOver'
