class Main < BaseController
  def index
    # @word = "FUCKING INSTANCE VARIABLE"
    # @word = request.session[:huy].code
    # @word = "#{User.all}"
    @main = "VARIABLE"
    render
    # byebug
    # request.session[:huy] = GameCodebreaker::Game.new
    # redirect '/show'
  end
end