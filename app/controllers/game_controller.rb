class GameController < BaseController
  def start 
    request.session[:game] = GameCodebreaker::Game.new
    redirect '/play'
  end

  def play
    # User.create(name:"Oleg", surname: "Gudeychuk", age: 27)
    @length = game.length
    game.history.last ? @result = game.history.last.last : @result = 'nothing'
    @turns = game.turns
    render
  end

  def guess
    insert_code = request.params['enter_code']
    game.respond(insert_code)
    request.session[:game] = game
    redirect '/play'
  end
end