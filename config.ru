require 'bundler'
Bundler.require

require File.join(File.dirname(__FILE__),'lib', 'racker')
require File.join(File.dirname(__FILE__),'lib', 'request_controller')

# Load the settings routes
RackerApplication = Racker.new
require File.join(File.dirname(__FILE__),'config', 'routes')


use Rack::Reloader
run RequestController.new