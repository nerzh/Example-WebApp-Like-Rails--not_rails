# Dir["app/models/*"].each {|file| require_relative file }
require 'active_record'
require_relative '../models/game'
require_relative '../models/user'
require_relative '../models/story'

class BaseController
  attr_reader :env, :request, :response, :game

  def initialize(env)
    @env = env
    @request  = Rack::Request.new(env)
    @response = Rack::Response.new
    
    dbconfig = YAML::load(File.open(File.join(File.dirname(__FILE__), '..', '..', 'config', 'database.yml')))
    ActiveRecord::Base.logger = Logger.new(STDERR)
    ActiveRecord::Base.establish_connection(dbconfig['development'])

    @game = @request.session[:game] if @request.session[:game].class == GameCodebreaker::Game
  end

  def render(template = '')
    self.class.to_s.downcase =~ /^(.+)controller$/
    name_controller = $1
    template = caller_locations.first.label if template == ''
    path = File.expand_path("../../views/#{name_controller}/#{template.to_s}.html.haml", __FILE__)
    path_layout = File.expand_path("../../views/layout.html.haml", __FILE__)
    block = lambda{ Haml::Engine.new(File.read(path)).render(binding) }
    response.body = [ Haml::Engine.new(File.read(path_layout)).render { block.call } ]
    response
  end

  def redirect(url)
    response.redirect(url)
    response
  end

  def params
    request.params
  end
end