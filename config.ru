require 'bundler'
Bundler.require

require File.join(File.dirname(__FILE__),'lib', 'base_routes')
require File.join(File.dirname(__FILE__),'lib', 'main_application')

# Load the settings routes
InstanceRoute = BaseRoutes.new
require File.join(File.dirname(__FILE__),'config', 'routes')

use Rack::Reloader
use Rack::Session::Cookie, :key => 'rack.session',
                           :path => '/',
                           :expire_after => 2592000,
                           :secret => 'change_me',
                           :old_secret => 'also_change_me'
use Rack::Static, :urls => ['/images', '/css'], :root => 'public'
run MainApplication.new