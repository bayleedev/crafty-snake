subject = game.board()

describe 'Board', ->

  describe '#taken', ->

    beforeEach (done) ->
      Crafty.e('Solid, Grid').at(1, 1)
      done()

    it 'is not taken on 0,0', ->
      expect(subject.taken(0,0)).to.be.false

    it 'is taken on 1,1', ->
      expect(subject.taken(1,1)).to.be.true

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
