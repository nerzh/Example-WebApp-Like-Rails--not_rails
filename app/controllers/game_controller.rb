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
    @hints   = game.hints
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
    redirect '/play'
  end

  def result
    play_if_game_not_over
    @secret_code = game.code
    @history     = game.history
    @hint        = game.hint
    @turns       = game.level - game.turns
    game.win? ? @mess = 'YOU WIN' : @mess = 'YOU LOSE'
    render
  end

  def save
    play_if_game_not_over    
    render
  end

  def play_if_game_not_over
    return redirect '/' unless game
    return redirect '/' unless game.game_over?
  end

  def create
    begin
      unless @user = User.where(name: params['name'], surname: params['surname']).first
        @user = User.new(name: params['name'], surname: params['surname'], age: params['age'])
      end
      @sgame = Game.new( code: game.code, length: game.length, level: game.level, turns: game.turns,
                       hint: game.hint, win: game.win, level_name: game.level_name )

      game.hints.each { |hint| @hint = Hint.new(hint: hint); @sgame.hints << @hint }
      
      game.history.each do |story|
        @story = Story.new(secret_code: story[0], human_code: story[1], result: story[2])
        @sgame.stories << @story
      end

      @user.games << @sgame
      @user.save!

      redirect '/exit'
    rescue StandardError => ex
      @error = ex.message
      render 'info'
    end
  end
end