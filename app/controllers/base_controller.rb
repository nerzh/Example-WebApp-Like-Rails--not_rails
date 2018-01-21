class BaseController < Controller::Base
  def game
    @request.session[:game] if @request.session[:game].class == GameCodebreaker::Game
  end
end