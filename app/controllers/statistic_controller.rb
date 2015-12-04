class StatisticController < BaseController
  def st_login
    render
  end

  def show
    unless @user = User.where(name: params['name'], surname: params['surname']).first
      return render 'info'
    end
    @name = @user.name
    @surname = @user.surname
    @age = @user.age
    @total_games = @user.games.size
    @total_wins = @user.games.where(win: true).size
    @total_losses = @user.games.where(win: false).size

    @user.games.where(win: true).each { |game| @total_turns ||=0; @total_turns += game.turns }
    @average_turns = @total_turns/@total_wins

    render
  end
end