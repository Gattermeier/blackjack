class window.Game extends Backbone.Model
  initialize: ->
    console.log('NEW GAME STARTED')
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get 'playerHand'
      .on 
        'add': @playerPlays
        'stand': @dealerPlays
      , @

  playerPlays: ->
    # math of the scors
    player = @get 'playerHand'
    pScore = @getHighScore(player.scores())
    
    if pScore is 21 then player.stand()
    if pScore > 21 then @endGame 'Dealer'


      # if dealerscore higher than 21 - loose
      #compare dealerscore with player max score
      #if dealerscore higher -> win

  dealerPlays: ->
    dealer = @get 'dealerHand'
    player = @get 'playerHand'
    dealer.at(0).flip()
    dScore = @getHighScore(dealer.scores())
    pScore = @getHighScore(player.scores())
    while @calculate(dScore, pScore)
      dealer.hit()
      dScore = @getHighScore(dealer.scores())

  calculate: (dScore,pScore) ->
    if dScore > 21 then @endGame 'Player'; return false 
    if dScore > pScore then @endGame 'Dealer'; return false
    if dScore is 21 and pScore is 21 then @endGame 'Push'; return false
    return true

  getHighScore: (scoresArray) ->
    if scoresArray[0] > 21 then finalScore = scoresArray[1]
    else if scoresArray[1] > 21 then finalScore = scoresArray[0]
    else finalScore = Math.max(scoresArray[1], scoresArray[0])
    finalScore

  endGame: (outcome) ->
    if outcome is 'Push' then alert outcome
    else alert outcome + ' wins'
    # Reset the game.. 
    @trigger 'ended', outcome

  
  
    
  
  


  
  
        

    
      
      