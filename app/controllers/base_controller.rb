# Dir["app/models/*"].each {|file| require_relative file }
require 'active_record'
require_relative '../models/game'
require_relative '../models/user'
require_relative '../models/story'

class BaseController
  attr_reader :env, :request, :response

  def initialize(env)
    @env = env
    @request  = Rack::Request.new(env)
    @response = Rack::Response.new
    dbconfig = YAML::load(File.open(File.join(File.dirname(__FILE__), '..', '..', 'config', 'database.yml')))
    ActiveRecord::Base.logger = Logger.new(STDERR)
    ActiveRecord::Base.establish_connection(dbconfig['development'])
  end

  def render(template = '')
    name_controller = self.class.to_s.downcase
    template = caller_locations.first.label if template == ''
    path = File.expand_path("../../views/#{name_controller}/#{template.to_s}.html.haml", __FILE__)
    response.body = [Haml::Engine.new(File.read(path)).render(binding)]
    response
  end

  def redirect(url)
    response.redirect(url)
    response
  end
end