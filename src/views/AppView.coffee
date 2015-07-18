class window.AppView extends Backbone.View 
  className: 'main container'

  template: _.template '
    <div class="title row"><div class="col-xs-12">BlackJack.io</div></div>    
    <div class="row">
      <div class="box scorebox col-xs-6"> 
      Current Score: <span class="scoreboard"></span>
      </div>
      <div class="box betbox col-xs-6">
      Your current bet: <span class="bet"></span>
      </div>
    <div class="col-xs-12 col-sm-6"> 
    <form class="form-inline">
      <div class="form-group col-xs-12 col-sm-6" style="padding:0">
        <label class="sr-only" for="betting">Amount (in dollars)</label>
        <div class="input-group">
          <div class="input-group-addon">$</div>
          <input type="text" class="form-control" id="betting" placeholder="Amount">
        </div>
      </div>
      <button type="button" id="startgame" class="btn btn-primary col-xs-12 col-sm-3">Place bet</button>
    </form>
    </div>
    </div>
    <div class="gameboard row"></div>
  '
  initialize: ->
    @renderBasics()
    @model.on 'change:currentGame', => @renderGame()
    @model.on 'reset', => @renderBasics()

  renderBasics: ->
    @$el.children().detach()
    @$el.html @template()
    @$el.find('.scoreboard').html @model.get 'totalWinnings'
    
  renderGame: ->
    @$el.children().detach()
    @$el.html @template()
    @$el.find('.scoreboard').html @model.get 'totalWinnings'
    @$el.find('.bet').text @model.get 'bet'
    @$el.find('.gameboard').html new GameView({model: @model.get('currentGame')}).el

  events: {
    'click #startgame' : 'startGame'
  }

  startGame: ->
    bet = Number($('#betting').val())
    currentWinnings = @model.get 'totalWinnings'
    console.log 'bet: ' + bet
    console.log 'typeof bet: ' + typeof bet
    if bet > 0 and bet <= currentWinnings 
      @model.startGame(bet)
    else alert 'You need to make a valid bet'
  
  # template: _.template '
  #   <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
  #   <div class="player-hand-container"></div>
  #   <div class="dealer-hand-container"></div>
  # '

  # events:
  #   'click .hit-button': -> @model.get('playerHand').hit()
  #   'click .stand-button': -> @model.get('playerHand').stand()

  # initialize: ->
  #   @render()

  # render: ->
  #   @$el.children().detach()
  #   @$el.html @template()
  #   @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
  #   @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

