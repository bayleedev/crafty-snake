subject = game.board()

describe 'Board', ->

  describe '#width', ->

    beforeEach (done) ->
      subject.map_grid.width = 10
      subject.map_grid.tile.width = 5
      done()

    it 'returns tiles wide * tile width', ->
      expect(subject.width()).to.equal(50)

  describe '#height', ->

    beforeEach (done) ->
      subject.map_grid.height = 10
      subject.map_grid.tile.height = 6
      done()

    it 'returns tiles high * tile height', ->
      expect(subject.height()).to.equal(60)
