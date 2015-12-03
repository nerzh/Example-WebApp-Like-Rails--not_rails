class Custom < BaseController
  def index
    @word = "FUCKING INSTANCE VARIABLE"
    @word = request.session[:huy].code
    # @word = "#{User.all}"
    render
    # byebug
    # request.session[:huy] = GameCodebreaker::Game.new
    # redirect '/show'
  end
# byebug
  def show
    byebug
    # User.create(name:"Oleg", surname: "Gudeychuk", age: 27)
    @zal = request.session[:huy].length
    # @zal = User.all.first.name
    render
    # @request = Rack::Request.new(env)

    # Response.new.tap do |response|
    #   response.body = "Catchall Route"
    #   response.status_code = 200
    # end

    # render :index
  end
end