class GameController < BaseController
  def start
    if param = params['level']
      level  = GameCodebreaker::Options.level(param)[:level]
      hint   = GameCodebreaker::Options.level(param)[:hint]
      request.session[:game] = GameCodebreaker::Game.new(level: level, hint: hint, level_name: param)
      return redirect '/play'
    end
    request.session[:game] = GameCodebreaker::Game.new
    redirect '/play'
  end

  def restart
    if game.class == GameCodebreaker::Game
      param  = game.level_name
      level  = GameCodebreaker::Options.level(param)[:level]
      hint   = GameCodebreaker::Options.level(param)[:hint]
      request.session[:game] = GameCodebreaker::Game.new(level: level, hint: hint, level_name: param)
      return redirect '/play'
    end
    redirect '/start'
  end

  def exit
    request.session[:game] = nil
    redirect '/'
  end

  def play
    return redirect '/'       unless game
    return redirect '/result' if game.game_over?
    @length  = game.length
    @turns   = game.level - game.turns
    @hint    = game.hint
    @history = game.history
    render
  end

  def guess
    insert_code = params['enter_code']
    game.respond(insert_code)
    request.session[:game] = game
    redirect '/play'
  end

  def hint
    game.get_hint
    response.body = [game.hints.last]
    response
  end

  def result
    return redirect '/' unless game
    return redirect '/' unless game.game_over?
    @secret_code = game.code
    @history     = game.history
    @hint        = game.hint
    @turns       = game.level - game.turns
    game.win? ? @mess = 'YOU WIN' : @mess = 'YOU LOSE'
    render
  end

  def save
    return redirect '/' unless game
    return redirect '/' unless game.game_over?
    render
  end

  def create
    user = User.new(name: params['name'], surname: params['surname'], age: params['age'])
    user.save!
    redirect '/'
  end
end