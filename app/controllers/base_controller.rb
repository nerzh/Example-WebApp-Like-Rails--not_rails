require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'response_controller')

class BaseController
  attr_reader :env

  def initialize env
    @env = env
  end

  def render(binding, template = '')
    name_controller = self.class.to_s.downcase
    template = caller_locations.first.label if template == ''
    path = File.expand_path("../../views/#{name_controller}/#{template.to_s}.html.haml", __FILE__)
    Response.new(Haml::Engine.new(File.read(path)).render(binding))
  end
end