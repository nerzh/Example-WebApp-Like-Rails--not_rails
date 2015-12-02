class Response
  # attr_accessor :status_code, :headers, :body
  attr_accessor :html

  def initialize(html)
    # @headers = {}
    @html = html
  end

  def rack_response
    # [status_code, headers, Array(body)]
    Rack::Response.new(html)
  end


end