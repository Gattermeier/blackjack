assert = chai.assert
expect = chai.expect

describe 'Game should initialize properly', ->
  game = null

  beforeEach ->
    game = new Game();


  it 'should have a deck', ->
    assert.typeOf(game.get('deck'), 'object')
    expect(game.get('deck')).to.be.an.instanceOf(Deck)

  describe 'it has a player hand', ->
    it 'has a length of two cards to start', ->
      expect(game.get('playerHand').length).to.equal(2)
      
    it 'is an instance of the Hand model', ->
      expect(game.get('playerHand')).to.be.an.instanceOf(Hand)
      
  describe 'it has a dealer hand', ->
    it 'has a length of two cards to start', ->
      expect(game.get('dealerHand').length).to.equal(2)

    it 'is an instance of the Hand model', ->
      expect(game.get('dealerHand')).to.be.an.instanceOf(Hand)

    it 'first card is flipped', ->
      expect(game.get('dealerHand').at(0).get('revealed')).to.be.false

describe 'proper game function', ->
  game = null

  beforeEach ->
    game = new Game()
  
  describe 'getHighScore function', ->

    it 'returns highest valid score of a score array', ->
      expect(game.getHighScore([18,19])).to.equal(19)
      expect(game.getHighScore([19,18])).to.equal(19)
      expect(game.getHighScore([21,18])).to.equal(21)
      expect(game.getHighScore([22,18])).to.equal(18)
      expect(game.getHighScore([18,22])).to.equal(18)
      return
  
  describe 'score calculation function', ->

    it 'returns correct outcome or score calculation', ->
      expect(game.calculate(22,10)).to.be.false
      expect(game.calculate(20,10)).to.be.false
      expect(game.calculate(21,21)).to.be.false
      expect(game.calculate(10,18)).to.be.true
    



    
    
  