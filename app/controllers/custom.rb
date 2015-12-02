class Custom < BaseController
  def index
    @word = "FUCKING INSTANCE VARIABLE"
    render binding
  end

  def show
    # Response.new.tap do |response|
    #   response.body = "Catchall Route BLYATЪ"
    #   response.status_code = 200
    # end
  end
end