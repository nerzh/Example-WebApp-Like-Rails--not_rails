# class Response
#   # attr_accessor :status_code, :headers, :body
#   # attr_accessor :html

#   def initialize(html)
#     # @headers = {}
#     @html = html
#   end

#   def rack_response
#     # [status_code, headers, Array(body)]
#     Rack::Response.new(@html)
#   end


# end



module HTTP

#   class Lib
#   def render(template = '')
#     name_controller = self.class.to_s.downcase
#     template = caller_locations.first.label if template == ''
#     path = File.expand_path("../../app/views/#{name_controller}/#{template.to_s}.html.haml", __FILE__)
#     # Response.new( Haml::Engine.new(File.read(path)).render(binding) )
#     response.body = [Haml::Engine.new(File.read(path)).render(binding)]
#     response
#   end

#       # @env = env
#     # @request  = Rack::Request.new(env)
#     # @response = Rack::Response.new


#     # def env
#     #   env
#     # end
# # byebug
#     def request
#       Rack::Request.new(env)
#     end

#     def response
#       Rack::Response.new
#     end
# end


end